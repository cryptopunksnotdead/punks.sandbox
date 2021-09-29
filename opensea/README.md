# Quick & Dirty "One-Off" Scripts to Download Complete Collections (from Open Sea)


As an example let's redo the 24px collection (that is, the first 24px collection - 24px Cool Cats).


Step 1 - Download all meta data files (in JSON) for the complete
collection via the OpenSea HTTP API


See [**24px/download_meta**](24px/download_meta.rb)


Step 2 - Download all "hi-res" images for the complete
collection using the image reference in the downloaded meta data (from step 1)


See [**24px/download_images**](24px/download_images.rb)


Step 3 - "Pixelate" all "hi-res" images down
to the original resolution (e.g. 24x24 or 28x28)
and try to change the background color to transparent

See [**24px/pixelate**](24px/pixelate.rb)


Step 4 - Profit!  Generate the All-In-One Composite Images
from the "Pixelated" Originals (from step 3)

See [**24px/composite**](24px/composite.rb)



Bonus - Step 5 - Generate a Attribute Dataset in the Comma-Separated Values (CSV) Tabular Format from the JSON Meta Datasets (in step 1)

See [**24px/attributes**](24px/atttributes.rb)




That's it for now.







## Ready-to-Download All-In-One 24px (and 28px¹) Collection Image Composites

See the [**Awesome 24px (and 28px¹) Downloads**](https://github.com/cryptopunksnotdead/awesome-24px) page
for free ready-to-download pixel art collections in the 24x24 (and 28x28¹) format.

¹: Note - The bored apes from the weape24 series are in the original ~24x24~ 28x28 format.




## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.

