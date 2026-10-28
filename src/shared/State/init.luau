local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Reflex = require(ReplicatedStorage.Packages.reflex)

local producers = require(script.Producers)

local rootProducer = Reflex.combineProducers(producers)
return rootProducer