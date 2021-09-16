function newPopulation = doSurvivorSelection(Population,offsprings)
    newPopulation = [Population;offsprings];
    numberofPopulation = numel(newPopulation);
    %% number of dead elements
    [~,sorted_population] = sort([newPopulation.Fitness]);
    newPopulation = newPopulation(sorted_population);
    survived_number = round(numberofPopulation * 90 /100);
    survived_population = newPopulation(1:survived_number);
    remained_number = round((numberofPopulation * 10 /100)*10/100);
    if remained_number<=1
       remained_number = 2; 
    end
   random_number = randperm(abs(numberofPopulation -survived_number) ,remained_number)+ survived_number;
   survived_population(survived_number+1:survived_number+remained_number) = newPopulation(random_number(1:remained_number));
   newPopulation = survived_population ;
end
