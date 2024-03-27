function processInstance(instancePath)
    
    numberOfObjects = nothing
    objectWeights = Float64[]

    open(instancePath, "r") do file

        numberOfObjects = split(readline(file), '\t')[2]

        for line in eachline(file)
            currentWeight = parse(Float64, split(line, '\t')[3])
            push!(objectWeights, currentWeight)
        end

    end

    return numberOfObjects, objectWeights

end

# This checks if exactly one argument is passed 
# (the path to the instance of the problem)
if length(ARGS) != 1
    println("Usage: julia tp1_2020006450.jl <path_to_instance_of_problem>")
    exit(1)
end

# Extract the path to the instance file 
# from the command line arguments
instancePath = ARGS[1]

numberOfObjects, objectWeights = processInstance(instancePath)