function fitness = CalculateFitness(x)
   %% sum of Threats in each situations
   fitness = 0;
for j = 1 :2: 14  %% [6,4,1,2,3,7,2,4,6,3,8,4,6,7,3,4]
     for k = j+2:2:15
          if x(j) == x(k)  %% rows 
               fitness = fitness +1;
          elseif x(j+1) == x(k+1)
               fitness = fitness + 1;  %% columns
          elseif abs(x(j)-x(k)) == abs(x(j+1) - x(k+1))
               fitness = fitness + 1;  %% ghotr
          end
     end
end
end