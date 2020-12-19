# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Candidate.create!([
  {
    user: User.new(provider: 'slack', uid: '10001'),
    first_name: 'First Candidate',
    last_name: 'Candidate One',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    why: 'Nunc id cursus metus aliquam eleifend mi in.',
    professional: true
  },
  {
    user: User.new(provider: 'slack', uid: '1002'),
    first_name: 'Second',
    last_name: 'Candidate',
    bio: 'Bacon ipsum dolor amet short ribs brisket venison rump drumstick pig sausage prosciutto chicken spare ribs salami picanha doner. Kevin capicola sausage, buffalo bresaola venison turkey shoulder picanha ham pork tri-tip meatball meatloaf ribeye. Doner spare ribs andouille bacon sausage. Ground round jerky brisket pastrami shank.',
    why: 'Tri-tip pork loin kevin t-bone shank ham tongue capicola. Bacon fatback chislic, landjaeger salami alcatra cupim pancetta short ribs porchetta. Capicola filet mignon buffalo, shoulder cupim ball tip chuck shank. Frankfurter beef shoulder, andouille pig burgdoggen jowl ham porchetta pancetta pastrami tongue capicola. Sausage cupim pastrami kielbasa, shoulder beef spare ribs porchetta short ribs corned beef swine picanha. T-bone pastrami jowl shankle boudin meatloaf ball tip drumstick pork chop pork ham hock.',
    professional: false
  },
  {
    user: User.new(provider: 'slack', uid: '1003'),
    first_name: 'Third',
    last_name: 'Candidate',
    bio: 'Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.',
    why: 'Capitalize on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps. Nanotechnology immersion along the information highway will close the loop on focusing solely on the bottom line.',
    professional: false
  },
  {
    user: User.new(provider: 'slack', uid: '1004'),
    first_name: '4th Candidate',
    last_name: 'Four',
    bio: 'Dragée pastry gummi bears soufflé. Gummi bears chocolate cake croissant fruitcake oat cake marshmallow. Pastry croissant wafer. Biscuit sweet macaroon cupcake bear claw. Danish wafer wafer cookie topping muffin. Tart jelly beans marzipan lemon drops bonbon tootsie roll.',
    why: 'Dessert topping liquorice croissant liquorice cupcake liquorice. Brownie chocolate chupa chups tart jelly beans icing marshmallow. Tart lemon drops chocolate bar marshmallow tootsie roll. Sesame snaps candy canes jujubes. Candy canes powder sweet roll tiramisu pudding bear claw caramels jelly-o lollipop. Sugar plum tootsie roll marzipan sugar plum dessert bonbon chupa chups marzipan. Candy cake donut sugar plum marzipan gingerbread bear claw chocolate bar sesame snaps. Ice cream sweet wafer tootsie roll candy canes wafer chocolate bar.',
    professional: true
  },
  {
    user: User.new(provider: 'slack', uid: '1005'),
    first_name: 'Five',
    last_name: 'Fifth',
    bio: 'Turpis massa tincidunt dui ut ornare. Id cursus metus aliquam eleifend mi in.',
    why: 'In cursus turpis massa tincidunt dui ut. Laoreet suspendisse interdum consectetur libero id faucibus. Etiam sit amet nisl purus in. Cursus sit amet dictum sit amet justo.',
    professional: false
  },
  {
    user: User.new(provider: 'slack', uid: '1006'),
    first_name: 'A.',
    last_name: 'Dog',
    bio: 'Bow wow',
    why: "On the internet, no one knows you're a dog.",
    professional: true
  }
])
