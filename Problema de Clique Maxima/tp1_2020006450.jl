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

numberOfVertices, graph = processInstance("./Problema de Clique Maxima/exemplosCliqueMaxima/instancias/INST1_PB2.txt")
