# Through the Ages: Apple Animation APIs

#### Try out real code from NextStep to Mac OS X to SwiftUI

---

I recently stumbled upon John Siracusa's legendary Mac OS X reviews for the first time.

If you're not in the loop, these were astonishingly detailed technical reviews of Apple's major Mac OS X releases between 1999 and 2014. According to [Ars Technica](https://arstechnica.com/gadgets/2015/04/after-fifteen-years-ars-says-goodbye-to-john-siracusas-os-x-reviews/), where these were published, *"a new OS X release started with Steve Jobs and ended with John Siracusa."* I voraciously delved into these reviews with a [handy reading list](https://gist.github.com/kconner/cff08fe3e0bb857ea33b47d965b3e19f) as my tour guide.

What I found most fascinating - and what really inspired me to write this - was the piece on [Core Animation](https://arstechnica.com/gadgets/2007/10/mac-os-x-10-5/8/) from 2007. As a Swift baby, who barely remembers the [Grand Renaming](https://docs.elementscompiler.com/Silver/GrandRename/) of Swift 2.0 -> 3.0, Core Animation is as fundamental as iOS itself, underpinning both UIKit and SwiftUI.

Learning of the existence of a world before Core Animation is like finding out that Santa isn't real. What? You mean the pixels didn't get around my screen by magic? It's like learning that before we invented fire, we cooked food by re-arranging the atoms by hand. Which, incidentally, is more or less what you had to do with pixels on first-gen GUIs.

In this article, I'm going to guide you on a journey through time to discover what was available to the Apple devs of each era; [play with some old-fashioned code](https://github.com/jacobsapps/animation-through-the-ages); and understand the problems solved by each generation of animation APIs.

In this article, I'm going to guide you on a journey through time to discover what was available to the Apple devs of each era; explain the problems solved by each successive generation of animation APIs; and even give you the opportunity to [play with some real-life old-school animation code in this GitHub project](https://github.com/jacobsapps/animation-through-the-ages).

---

### Timeline

- **1989** - NextStep Generation: Display PostScript
- **2001** - Apple's Renaissance: Quartz & OpenGL
- **2007** - The Modern Era: Core Animation
- **2014** - The Performance Age: Metal
- **2019** - The Declarative Revolution: SwiftUI

---
