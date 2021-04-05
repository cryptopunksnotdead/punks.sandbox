# Notes

Updating Market Data

## Todos

- [ ]  fix missing (0x000)  to column in sales - possible to fix with current transaction dataset?






## Article - Another look at cryptopunks prices

see <http://subopt.org/cryptopunks2.html> and
<http://subopt.org/punk-prices.py>


Accuracy and completeness
I believe these transactions are complete and error free except for the following corner case. If a punk somehow gets into a state where it is a) offered for sale for zero eth, and b) there is a non-zero bid on the punk, and c) someone then buys the punk for zero eth, it will show up on the chart as a sale for the non-zero bid amount. For more details, see below. Ironically, reporting this non-zero bid amount is probably more informative, since offering a punk for sale for zero eth is almost certainly a mistake by the seller.

Code
You can find the code for downloading the data and generating the plots here. The first time you run this script it will download all the relevant cryptopunks transactions to date. This can take some time, but you only need to do this batch download once as subsqeuent runs of the script only download new transactions. Also, there is a checkpointing mechanism in there, so if for some reason the script is interrupted simply re-launch it and it will pick up from near where it left off. After the transactions are downloaded and parsed, the graph (ethprices.png) and raw data (ethprices.txt) are written out. A file state.pkl is also generated that stores details of the transactions between runs.

Notes
An early project I did resorted to manual scraping of data from the site nonfungible.com, and you can find the result of those efforts here. Since then, someone has contributed a cryptopunks subgraph to The Graph. Great, should be simple now right? Well there were a few quirks to work out, stemming from both the way the subgraph was defined and the cryptopunks contract itself.

First it is useful to discuss a little bit about how subgraphs on The Graph operate. The writer of a subgraph first identifies a contract and the relevant events to track, as well as a set of variables, called entities, that the subgraph will track and manipulate as the various events occur. For instance, a seemingly important event for our purposes is PunkBought, which is an event signal emitted whenever a punk sale occurs. Furthermore, this event is supposedly emitted with information including the ID of the punk being bought, the address of the buyer and seller, and the amount of the sale. As for the entities, the subgraph defines several entities, and the important ones for our case are 'punks' and 'transactions'. Essentially, there is a 'punk' entity for each of the 10,000 punks, and each punk has several fields that are updated as each transaction occurs, in order to reflect the current state of that punk (what is the bid on the punk, who owns it, etc.)

The first issue that comes up is that there is not a specific entity for each transaction in which the amount paid in that transaction is stored. The only place where the sale amount is stored is in the punk entity which is updated after each relevant transaction. Consequently, if a punk is bought for amount X in block t and then later bought for amount Y at a later block u, any queries about the earlier transaction (e.g. by specifying transaction id or time range) from block t contain the updated amount for block u. Now, there is a workaround for this, which is to use the 'time-travel' feature of The Graph, which involves specifying a certain block and performing queries relative to this block. The problem with this solution is that it precludes bulk queries of details for punk transactions. In essence, using time-travel leads to a solution involving two stages. First, the script performs a bulk query to find all the transaction ids, and then in a second stage has to make individual queries for each transaction, at each instance using the time-travel feature to get the state of the punk entity at the exact block where each transaction occured. This slows things down and adds considerable of complexity. to the code.

The next issue stems from a glitch in the cryptopunks contract. When a sale happens, the PunkBought event is supposed to include the amount of the sale as one of the arguments. This is indeed the case when the sale is a result of a 'buy it now' type of transaction. However, when the sale is the result of the owner accepting a bid (that is, the acceptBidForPunk function), the amount passed is always zero. You can see the issue in the code here. On line 233, the PunkBought event is triggered with the argument bid.value passed. But at line 231 there is a call to a function that sets bid.value to zero. I believe this would be easily fixed by simply replacing 'bid.value' on line 233 with 'amount' but unfortuantely it is too late for such changes. The end result is that we need and another mechanism track the sale amounts.

Here is what I ended up doing. Whenever a PunkBought occurs, the .punk variable of the transaction entity is assigned. There are no other events that cause this assignment, so by filtering out all transactions where punk is not set, we end up with the list of transactions involving sales. Next, when we time travel to such a transaction, we first look at transaction.punk.amount. If this is non-zero, we can conclude that this was a buy-it-now event and the use value of punk.amount as the sale price. If the punk.amount is zero, there are two possibilities: this is either either a buy-it-now for zero event (yes, there are a handful of transactions of this sort) or it is an acceptBidForPunk event. To distinguish these two cases, we look at the transaction.punk.bid variable. If this is null then it was definitely a buy-it-now for zero event, since transaction.punk.bid is only non-zero if there is currently a bid. If the transaction.punk.bid is not zero, then there was an outstanding bid when the punk was sold, and we use this value as the sale price. Naturally, we'd expect then that this sale is due to the bid being accepted. However, we can not rule out the scenario that punk sold for zero with an outstanding non-zero bid. For instance, this could occur if someone bought a punk that already had a non-zero bid, and then accidently listed it for zero, and then someone bought it. In this case, our script will erroneously say that the punk was sold for a non-zero amount. Of course, this must be an exceedingly rare case.

I have a hunch that these issues are solvable by adding a few lines to the spec of the subgraph and redploying, but I'll leave that to someone more enterprising.






