# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

candidate = Candidate.create!([
  {
    user: User.new(provider: 'slack', uid: '10001'),
    first_name: "Beachy 'Not GOB' Batman",
    last_name: 'Lego Guy',
    bio: "No, just a regular mistake. I love this planet! I've got wealth, fame, and access to the depths of sleaze that those things bring. No argument here.",
    why: "We'll go deliver this crate like professionals, and then we'll go home. Daylight and everything. It's okay, Bender. I like cooking too. Of all the friends I've had… you're the first.",
    picture: "https://images.unsplash.com/photo-1538448174498-9956c159edb0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80",
    professional: true
  },
  {
    user: User.new(provider: 'slack', uid: '1002'),
    first_name: 'Techy',
    last_name: 'Guy Minfig',
    bio: 'Bacon ipsum dolor amet short ribs brisket venison rump drumstick pig sausage prosciutto chicken spare ribs salami picanha doner. Kevin capicola sausage, buffalo bresaola venison turkey shoulder picanha ham pork tri-tip meatball meatloaf ribeye. Doner spare ribs andouille bacon sausage. Ground round jerky brisket pastrami shank.',
    why: "Tri-tip pork loin kevin t-bone shank ham tongue capicola. Bacon fatback chislic, landjaeger salami alcatra cupim pancetta short ribs porchetta. Capicola filet mignon buffalo, shoulder cupim ball tip chuck shank. Frankfurter beef shoulder, andouille pig burgdoggen jowl ham porchetta pancetta pastrami tongue capicola. Sausage cupim pastrami kielbasa, shoulder beef spare ribs porchetta short ribs corned beef swine picanha. T-bone pastrami jowl shankle boudin meatloaf ball tip drumstick pork chop pork ham hock.",
    picture: "https://images.unsplash.com/photo-1586776977607-310e9c725c37?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1950&q=80",
    professional: false
  },
  {
    user: User.new(provider: 'slack', uid: '1003'),
    first_name: 'Glasses + Camera',
    last_name: 'Figure',
    bio: "Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.",
    why: "Capitalize on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps. Nanotechnology immersion along the information highway will close the loop on focusing solely on the bottom line.",
    picture: "https://images.unsplash.com/photo-1589789232265-3f2acdbfce28?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1950&q=80",
    professional: false
  },
  {
    user: User.new(provider: 'slack', uid: '1004'),
    first_name: 'Unicorn Onsie',
    last_name: 'Lego Figure',
    bio: "Dragée pastry gummi bears soufflé. Gummi bears chocolate cake croissant fruitcake oat cake marshmallow. Pastry croissant wafer. Biscuit sweet macaroon cupcake bear claw. Danish wafer wafer cookie topping muffin. Tart jelly beans marzipan lemon drops bonbon tootsie roll.",
    why: "Dessert topping liquorice croissant liquorice cupcake liquorice. Brownie chocolate chupa chups tart jelly beans icing marshmallow. Tart lemon drops chocolate bar marshmallow tootsie roll. Sesame snaps candy canes jujubes. Candy canes powder sweet roll tiramisu pudding bear claw caramels jelly-o lollipop. Sugar plum tootsie roll marzipan sugar plum dessert bonbon chupa chups marzipan. Candy cake donut sugar plum marzipan gingerbread bear claw chocolate bar sesame snaps. Ice cream sweet wafer tootsie roll candy canes wafer chocolate bar.",
    picture: "https://images.unsplash.com/photo-1518946222227-364f22132616?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80",
    professional: true
  },
  {
    user: User.new(provider: 'slack', uid: '1005'),
    first_name: 'Storm Trooper',
    last_name: 'On A Beach',
    bio: "Pommy ipsum gallivanting around meat and two veg up North come hither middle class, accordingly chav horses for courses round our gaff mince pies crisps, clotted cream is she 'avin a laugh a right royal knees up supper black cab. Bit of alright fish and chips some mothers do 'ave 'em doolally nosh gutted doofer not some sort of dosshouse a reet bobbydazzler, ended up brown bread chippy chaps in the goolies one would like chaps. Beefeater made a pig's ear of it upper class crumpets wellies copper pigeons in Trafalgar Square, flog a dead horse skive Victoria sponge cake clock round the earhole naff, Sonic Screwdriver we'll be 'avin less of that double dutch earwig naff off.",
    why: "Wibbly-wobbly timey-wimey stuff roast beef indeed have a bash on his bill fish fingers and custard nigh copped a bollocking trouble and strife, 10 pence mix bread and butter pudding golly a total jessie cornish pasty brainbox. Old chap Victoria sponge cake lad half-inch it done up like a kipper, mush put me soaps back on corgi drizzle, Northeners ear hole I'd reet fancy a. 'tis a bit miffed old chap got a lot of brass naff know your onions throw a paddy, tad not some sort of dosshouse brainbox have a bash lost the plot, scally challenge you to a duel lug hole ridicule complete mare. Corgi up North sweets jolly it's just not cricket off t'pub by 'eck love wellies, quid it's cracking flags hadn't done it in donkey's years bottled it taking the mick we'll be 'avin less of that. Rambunctious smeg spam fritters middle class man and his whippet marvelous Union Jack and crumpets bit of a div, cup of tea houlligan you mean it ain't me noggin' wedding tackle balderdash who brought loaf Prince Charles knackered ponce. Got his end away any road, best be off cheerio crumpets up at the crack of dawn have a bash fried toast, manky golly through the dales nicked hedgehog. Have a butcher's at this working class stupendous wellies, dignified a diamond geezer. Trouble and strife collywobbles Union Jack what a load of cobblers conkers, a tad willy pikey.",
    picture: "https://images.unsplash.com/photo-1472457897821-70d3819a0e24?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1949&q=80",
    professional: false
  },
  {
    user: User.new(provider: 'slack', uid: '1006'),
    first_name: 'A.',
    last_name: 'Dog',
    bio: 'Bow wow',
    why: "On the internet, no one knows you're a dog.",
    picture: "https://images.unsplash.com/photo-1591118731478-4f6cf2ac9f00?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80",
    professional: true
  }
])