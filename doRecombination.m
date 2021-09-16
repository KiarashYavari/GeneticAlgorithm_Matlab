function offsprings = doRecombination(parents)
    individualSize = numel(parents(1).Position);
    parentNumbers = numel(parents);
    offsprings = parents;
    random_num = randi(8);
    if random_num == 1
       random_num = random_num+1;
    elseif random_num/2 ~=0
        random_num = random_num*2;
    end
    for i=1:2:parentNumbers
        offspring1 = nan(1,individualSize);
        offspring2 = nan(1,individualSize);
        parent1 = parents(i).Position; 
        parent2 = parents(i+1).Position;  
        offspring1 = parent1(1:random_num);
        offspring2 = parent2(1:random_num);
        for j = random_num+1:2:individualSize-1
            while k_find(parent2(j:j+1),offspring1(1:random_num))
                parent2(j:j+1) = randperm(8,2);
            end
        end
        for k = random_num+1:2:individualSize-1
            while k_find(parent1(k:k+1),offspring2(1:random_num))
                parent1(k:k+1) = randperm(8,2);
            end
        end
        offspring1(random_num+1:individualSize) = parent2(random_num+1:individualSize);
        offspring2(random_num+1:individualSize) = parent1(random_num+1:individualSize);

        offsprings(i).Position = offspring1; 
        offsprings(i).Fitness = CalculateFitness(offsprings(i).Position);
        offsprings(i+1).Position = offspring2;
        offsprings(i+1).Fitness = CalculateFitness(offsprings(i+1).Position);
    end
end