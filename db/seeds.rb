john = Author.create!(
  name: "John"
)

jane = Author.create!(
  name: "Jane"
)

Post.create!(
  [
    {
      title: "Martian Chronicles",
      body: "Cult book by Ray Bradbury",
      author: john
    },
    {
      title: "The Martian",
      body: "Novel by Andy Weir about an astronaut stranded on Mars trying to survive",
      author: john
    },
    {
      title: "Doom",
      body: "A group of Marines is sent to the red planet via an ancient " \
                   "Martian portal called the Ark to deal with an outbreak of a mutagenic virus",
                   author: jane
    },
    {
      title: "Mars Attacks!",
      body: "Earth is invaded by Martians with unbeatable weapons and a cruel sense of humor",
      author: jane
    }
  ]
)
