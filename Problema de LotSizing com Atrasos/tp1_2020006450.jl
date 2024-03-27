function printFileReadInfo(numberOfPeriods, periodProductionCost, periodDemand, periodStockCost, periodLateFee)
    println("Number of periods $numberOfPeriods")
    for i in 1:numberOfPeriods
        productionCost = periodProductionCost[i]
        demand = periodDemand[i]
        stockCost = periodStockCost[i]
        lateFee = periodLateFee[i]
        println("-------------- Start Period $i --------------")
        println("Production cost = $productionCost")
        println("Demand = $demand")
        println("Stock = $stockCost")
        println("LateFee = $lateFee")
        println("-------------- End Period $i --------------")
    end
end

function processInstance(instancePath)
    
    numberOfPeriods = nothing
    periodProductionCost = Float64[]
    periodDemand = Float64[]
    periodStockCost = Float64[]
    periodLateFee = Float64[]

    open(instancePath, "r") do file

        numberOfPeriods = parse(Int, split(readline(file), '\t')[2])
        periodProductionCost = zeros(Float64, numberOfPeriods)
        periodDemand = zeros(Float64, numberOfPeriods)
        periodStockCost = zeros(Float64, numberOfPeriods)
        periodLateFee = zeros(Float64, numberOfPeriods)
        for line in eachline(file)

            splitLine = split(line, '\t')
            id = splitLine[1]
            num = parse(Int, splitLine[2])
            value = parse(Float64, splitLine[3])

            if id == "c"
                periodProductionCost[num] = value
            elseif id == "d"
                periodDemand[num] = value
            elseif id == "s"
                periodStockCost[num] = value
            elseif id == "p"
                periodLateFee[num] = value
            else
                println("Error reading input file")
                exit(1)
            end
            
        end

    end

    return numberOfPeriods, periodProductionCost, periodDemand, periodStockCost, periodLateFee

end

# Validates the command line arguments
if length(ARGS) != 1 && length(ARGS) != 2
    println("Usage: julia tp1_2020006450.jl <path_to_instance_of_problem> <optional_true_to_output_production_each_period>")
    exit(1)
end

# Extract the path to the instance file 
# from the command line arguments
instancePath = ARGS[1]
lenArgs = length(ARGS)

numberOfPeriods, periodProductionCost, periodDemand, periodStockCost, periodLateFee = processInstance(instancePath)
