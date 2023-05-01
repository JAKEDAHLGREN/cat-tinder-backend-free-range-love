cows = [
  {
    name:"Gus",
    age: 10,
    enjoys:"Graze on the freshest of grass",
    color:"Black",
    species:"Angus",
    image:"https://www.istockphoto.com/search/2/image?phrase=Angus%20cow&alloweduse=availableforalluses&excludenudity=true&sort=best&mediatype=photography&utm_source=unsplash&utm_medium=affiliate&utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2FAngus-cow&utm_term=Angus%20cow%3A%3A%3A",
  },
  {
    name:"T-Bone",
    age:12,
    enjoys:"Playing in the mud on a hot summer day",
    color:"Brown",
    species:"Beefmaster",
    image:"https://pixabay.com/photos/bull-field-beefmaster-summer-sunny-5866514/",
  },
  {
    name:"Stew",
    age: 8,
    enjoys:"Smelling the flowers and chasing bumble bees",
    color:"White with black spots",
    species:"Holstein",
    image:"CjwKCAjwxr2iBhBJEiwAdXECw5edES0WymsZeZlKkcHtCIJhDlgAMVkTL0FdJmGmVicQYJbJBby9_xoCiDQQAvD_BwE",
  },
  {
    name:"Buttercup",
    age:9,
    enjoys:"Sitting in the shade and looking at the clouds float by",
    color:"Light Brown",
    species:"Limousin",
    image:"https://p1.pxfuel.com/preview/815/692/933/limousin-cattle-bull-farm-cattle-breeding-horns-portrait.jpg",
  }
]
cows.each do |each_cow|
  Cow.create each_cow
  puts "creating cow #{each_cow}"
end