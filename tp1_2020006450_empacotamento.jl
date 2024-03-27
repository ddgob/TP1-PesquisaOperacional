# This checks if exactly one argument is passed 
# (the path to the instance of the problem)
if length(ARGS) != 1
    println("Usage: julia tp1_2020006450.jl <path_to_instance_of_problem>")
    exit(1)
end

# Extract the path to the instance file 
# from the command line arguments
instancePath = ARGS[1]

function processInstance(instancePath)
    open(instancePath, "r") do file
        for line in eachline(file)
            println(line)
        end
    end
end


processInstance(instancePath)
