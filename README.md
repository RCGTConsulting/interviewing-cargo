# README

## Models

This problem is about loading Packages onto Trucks and validating that the Truck can hold the Packages.

1. run `rails new cargo` to create a new Rails app
2. implement a model, Package, with a `size` attribute
   1. expect `Package.create!(size: 10)` to create and store an instance of Package
3. implement a model, Truck, that has a `capacity` attribute and many Packages (a Package _may_ be on a Truck, or it may not)
   1. expect `Truck.create!(capacity: 35)` to create and store an instance of Truck
   2. expect `Package.first.update!(truck: Truck.first)` to associate the Package with the Truck
   3. expect `Truck.first.packages` to return the Package that was added to the Truck
   4. expect `Package.create!(size: 5)` to create and store an instance of Package
4. add an instance method on Truck called `load_cargo` that takes a Package and "puts it on the truck"
   1. expect `Truck.first.load_cargo(Package.last)` to run without error
   2. expect `Truck.first.packages` to return two Packages, including the Package that was passed to `Truck#load_cargo`
5. add validation to ensure that the sum of the `size`s of its Packages does not exceed a Truck's `capacity`
   1. expect `Package.create!(size: 20) && Truck.first.load_cargo(Package.last)` to create and load_cargo a Package
   2. expect `Package.create!(size: 1) && Truck.first.load_cargo(Package.last)` to create an instance of Package but fail to save the Truck

## Controllers

### Setup

1. start from the git tag `controllers`
   1. if you have data in your database, stop the server and run `rails db:reset`
   2. if you don't have data in your database, run `rails db:setup`
2. create some model instances

```ruby
# first Truck
truck = Truck.create!(capacity: 35)
Package.create!(size: 10, truck: truck)
Package.create!(size: 5, truck: truck)
Package.create!(size: 20, truck: truck)

# second Truck
truck = Truck.create!(capacity: 50)
Package.create!(size: 20, truck: truck)
Package.create!(size: 20, truck: truck)
Package.create!(size: 2, truck: truck)

# third Truck
truck = Truck.create!(capacity: 10)
```

### Problems

1. add a Controller for the Truck model, with the actions `index` and `show`, and implement a View for the `index` action that lists the Trucks from the database, showing the attributes `id`, `capacity`, and `cargo_size` for each Truck
   1. expect http://localhost:3000/trucks/index to render the view and show the three Trucks created in the Setup section
2. make each `id` attribute in the `index` page a link to the Truck's `show` page
   1. expect clicking on an id in the `index` page to take the user to the empty `show` page
3. implement the `show` page, to show the same three attributes as the index page
   1. expect the `show` page to show the attributes
4. on the `show` page, list the ID of each Package on the Truck
   1. expect the `show` page to show the ID of each Package on the Truck
5. add a Controller for the Package model, with the `show` action, and implement a View for `Packages#show` that displays the Package attributes `id` and `size`
   1. expect loading `/packages/1` to show the Package with `id == 1`
6. make each Package `id` on the `Trucks#show` page a link to that Package's `show` page
   1. expect clicking a Package link to take the user to the Package's `show` page
7. add a JSON response to the `Trucks#show` action
   1. expect `curl -H 'Accept: application/json' http://localhost:3000/trucks/1` to return a JSON hash
