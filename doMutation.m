function offsprings = doMutation(offsprings)
    chosen_gene = randperm(numel(offsprings),14);  %% 
    random_num = randperm(8,4);
%     for i=1:13
%         while k_find(chosen_gene(i),chosen_gene(i+1:14),numel(chosen_gene(i+1:14)))
%             chosen_gene(i) = randi(numel(offsprings)); %% 
%         end
%     end  %% [24,4,32,1,16,3,18,10,36,8,14,19,26,20]
%     for i=1:3
%         while k_find(random_num(i),random_num(i+1:4),numel(random_num(i+1:4)))
%             random_num(i) = randi(8);
%         end
%     end  %% [8,3,4,7]
%     
    %% mutate or change four choromosmes of any of 14 genes pair by pair
    for k=1:14 
        gene = [];
        gene = offsprings(chosen_gene(k)).Position;  
        temp = gene(random_num(1));
        gene(random_num(1)) = gene(random_num(2));
        gene(random_num(2)) = temp;
        temp = nan;  
        temp = gene(random_num(3));
        gene(random_num(3)) = gene(random_num(4));  
        gene(random_num(4)) = temp;
        offsprings(chosen_gene(k)).Position = gene; 
        offsprings(chosen_gene(k)).Fitness = CalculateFitness(offsprings(chosen_gene(k)).Position);
    end
end