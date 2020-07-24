function [bal_energy_head]=aggrigation(head,S,num)

bal_energy_head=0;
disp('********************************************************');
if(S(head).E>0)

disp('in function aggrigation display sender');
disp(head);
 
%Data Aggregation Energy
%EDA=5*0.000000001;
EDA=50*0.0000001;

              
energy_loss = EDA*num; 
disp('energy_loss of CH during aggrigation is');
disp(energy_loss);
  
bal_energy_head = S(head).E-energy_loss;
disp('Bal energy of CH after aggrigation is');
disp(bal_energy_head);

end
end