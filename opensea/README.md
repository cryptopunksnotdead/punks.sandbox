# Quick & Dirty "One-Off" Scripts to Download Complete Collections (from Open Sea)


Yes, you can automate with scripts
the "right-click and download image"
for complete collections.

Note: For let's say a 9 900 artworks collection it's not
instantaneous and **be fair with your request and add a minimum 0.5sec or more wait delay / throttle**
since, yes, the script will run for hours
e.g. let's assume one request/per second and a collection with 9 990 artworks,
that is, about 9 900 seconds for 9 900 requests (if you assume
a non-blocking fast response) and 9 900 seconds -
that is about 60 minutes x 60 seconds equals 3600 seconds
thus, about three hours.

If you now download in step two the images that's another three hours
and so on.





## 24px (Cool Cats) Collection


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


Step 4 - Profit!  Generate the All-In-One Composite Image
from the "Pixelated" Originals (from step 3)

See [**24px/composite**](24px/composite.rb)



Bonus - Step 5 - Generate a Attribute Dataset in the Comma-Separated Values (CSV) Tabular Format from the JSON Meta Datasets (in step 1)

See [**24px/attributes**](24px/attributes.rb)




That's it for now.







## Ready-to-Download All-In-One 24px (and 28px¹) Collection Image Composites

See the [**Awesome 24px (and 28px¹) Downloads**](https://github.com/cryptopunksnotdead/awesome-24px) page
for free ready-to-download pixel art collections in the 24x24 (and 28x28¹) format.

¹: Note - The bored apes from the weape24 series are in the original ~24x24~ 28x28 format.




## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.

