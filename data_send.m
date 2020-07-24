function [bal_energy_receiver,bal_energy_sender,data_time,data_bytes]=data_send(sender,receiver,S,d)

data_time=0;
data_bytes=0;
 bal_energy_receiver=0;
 bal_energy_sender=0;

disp('********************************************************');
if(S(sender).E>0)

disp('in function data_send display sender');
disp(sender);
 
%req=S(sender).request();
%Eelec=Etx=Erx
 ETX=50*0.000000001;
%ETX=50*0.000000001;
 ERX=50*0.000000000001;
%ERX=50*0.000000000001;
%Transmit Amplifier types
 Efs=0.015*0.0000000000001;
%Efs=0.015*0.0000000000001;
 Emp=0.0013*0.00000000000001;
%Emp=0.0013*0.00000000000001;
%Data Aggregation Energy
EDA=5*0.00000000001;

emul=25000;
              
energy_loss =( (ETX)*(emul) + Emp*emul*( d*d*d*d )); 
disp('energy_loss of sender node is');
disp(energy_loss);
  
bal_energy_sender = S(sender).E-energy_loss; 

disp('balance energy of sender node is');
disp(bal_energy_sender); 
        

disp('energy loss of reciever in receiving the data packet');
    
        energy_loss_rec=( (ERX)*(emul)  + Efs*emul*(d*d*d*d));
        disp(energy_loss_rec);
      
        bal_energy_receiver=S(receiver).E - energy_loss_rec;

data_bytes=1.2;
data_time=0;
 
 
end