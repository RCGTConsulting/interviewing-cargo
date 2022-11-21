# README

## The Problem

This problem is about loading Packages onto Trucks and validating that the Truck can hold the Packages.

1. run `rails new cargo` to create a new Rails app
2. implement a model, Package, with a `size` attribute
   1. expect `Package.create!(size: 10)` to create and store an instance of Package
3. implement a model, Truck, that has a `capacity` attribute and many Packages (a Package _may_ be on a Truck, or it may not)
   1. expect `Truck.create!(capacity: 35)` to create and store an instance of Truck
   2. expect `Package.first.update!(truck: Truck.first)` to associate the Package with the Truck
   3. expect `Truck.first.packages` to return the Package that was added to the Truck
4. add an instance method on Truck called `load` that takes a Package and "puts it on the truck"
   1. expect `Package.create!(size: 5)` to create and store an instance of Package
   2. expect `Truck.first.load(Package.last)` to run without error
   3. expect `Truck.first.packages` to return two Packages, including the Package that was passed to `Truck#load`
5. add validation on Truck to ensure that the sum of the `size`s of its Packages does not exceed its `capacity`