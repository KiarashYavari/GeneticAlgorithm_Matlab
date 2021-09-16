clc;
clear;
close all;

%% Problem Info
FitenessFunction = @(x) CalculateFitness(x,populationSize);

populationSize = 300;  %% exammple--> a hundred situations of queens from 8!
GenereationNumber = 200;
parentNumber = populationSize / 2;

RecombinationRate = 0.9;
MutationRate = 0.2;

%% Initialization
individual.Position = [];
individual.Fitness = [];
Population = repmat(individual,populationSize,1);

for i=1:populationSize
    Population(i).Position = [randperm(8,4) randperm(8,4) randperm(8,4) randperm(8,4)];
    Population(i).Fitness = CalculateFitness(Population(i).Position);
end

% % Main Loop
tic;
for i=1:GenereationNumber
    offsprings = nan;
    parents = doParentSelection(Population,populationSize,parentNumber);
    if isAllowedtoRecombine(RecombinationRate)
        offsprings = doRecombination(parents);
        if isAllowedtoMutate(MutationRate)
            offsprings = doMutation(offsprings);  %% move 4 Chromosome of 14 genes   
        end
       Population = doSurvivorSelection(Population,offsprings); 
    end
end
toc;

%% answer info
answer = Population(1).Position;
disp(['Best Individual: ' mat2str(answer) ', with Fitness: ' num2str(Population(1).Fitness)]);
% x_border1(1:populationSize) = Population(1:populationSize).Fitness;
% plot(x_border1,populationSize,'--or');
chessboard(8);
QR = answer(1:2:16);
QC = answer(2:2:16);
icon = char(9819);
text(QC,QR,icon,'Color',[0.2,0.9,0.8],'FontSize', 200/8,'HorizontalAlignment','Center') %Font size scaling found to be suitable

%% [0.522,0.376,0.702] purple
