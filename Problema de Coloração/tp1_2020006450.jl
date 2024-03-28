using JuMP, HiGHS

function printGraph(graph)

    println(numberOfVertices)

    for i in 1:numberOfVertices

        for j in 1:numberOfVertices
            print(graph[i, j], " ")
        end

        println()

    end
end

function processInstance(instancePath)
    
    numberOfVertices = nothing
    graph = nothing

    open(instancePath, "r") do file

        numberOfVertices = parse(Int, split(readline(file), '\t')[2])
        graph = zeros(Int, numberOfVertices, numberOfVertices)

        for line in eachline(file)
            origin = parse(Int, split(line, '\t')[2])
            destination = parse(Int, split(line, '\t')[3])
            graph[origin, destination] = 1
        end

    end

    return numberOfVertices, graph

end

# Validate command line arguments
if length(ARGS) != 1 && length(ARGS) != 2
    println("Usage: julia tp1_2020006450.jl <path_to_instance_of_problem> <optional_true_to_output_vertice_solution_set>")
    exit(1)
end

# Extract the path to the instance file 
# from the command line arguments
instancePath = ARGS[1]
lenArgs = length(ARGS)

numberOfVertices, graph = processInstance(instancePath)

