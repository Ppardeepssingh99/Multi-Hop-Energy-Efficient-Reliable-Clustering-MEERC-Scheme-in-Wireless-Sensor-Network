%Tamanna-improved
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%
round_val=1;
rmax=5; 
time=0;
bytes=0;
Routing_pack=0;

%Field Dimensions - x and y maximum (in meters)
xm=100;
ym=100;

%x and y Coordinates of the Sink
sink.x=xm;
sink.y=ym;

%Number of Nodes in the field
n=100;

%Optimal Election Probability of a node
%to become cluster head
p=0.1;

%Energy Model (all values in Joules)
%Initial Energy 
Eo=0.5;
%Eelec=Etx=Erx
ETX=50*0.000000001;
ERX=50*0.000000001;
%Transmit Amplifier types
Efs=10*0.000000000001;
Emp=0.0013*0.000000000001;
%Data Aggregation Energy
EDA=5*0.000000001;

%Values for Hetereogeneity
%Percentage of nodes than are advanced
m=0.1;
%\alpha
a=1;

  

%%%%%%%%%%%%%%%%%%%%%%%%% END OF PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%

%Computation of do
do=sqrt(Efs/Emp);

%Creation of the random Sensor Network
figure(1);

for i=1:1:10
area(i)=0;
end

for i=1:1:n
    S(i).xd=rand(1,1)*xm;
    XR(i)=S(i).xd;
    S(i).yd=rand(1,1)*ym;
    YR(i)=S(i).yd;
    S(i).G=0;
    
    %initially there are no cluster heads only nodes
    S(i).type='N';
    S(i).name=i;
    
       X=S();
[C_id]= cluster_id(X,i);

S(i).id=C_id;
%Find the number of nodes in each of 9 areas
% area(i) defines the number of nodes in all 9 areas + Not in any area C=10

if (C_id==10)
    area(10)=area(10)+1;
elseif (C_id==1)
    area(1)=area(1)+1;
elseif (C_id==2)
    area(2)=area(2)+1;
elseif (C_id==3)
    area(3)=area(3)+1;
elseif (C_id==4)
    area(4)=area(4)+1;
elseif (C_id==5)
    area(5)=area(5)+1;
elseif (C_id==6)
    area(6)=area(6)+1;
elseif (C_id==7)
    area(7)=area(7)+1;
elseif (C_id==8)
    area(8)=area(8)+1;
elseif (C_id==9)
    area(9)=area(9)+1;
end    
    
        S(i).E=Eo;
        S(i).ENERGY=0;
     if (S(i).id==10)
        plot(S(i).xd,S(i).yd,'black *');
        hold on;
     elseif (S(i).id==1)
        plot(S(i).xd,S(i).yd,'g o');
        hold on;   
     elseif (S(i).id==2)
        plot(S(i).xd,S(i).yd,'r o');
        hold on;
     elseif (S(i).id==3)
        plot(S(i).xd,S(i).yd,'b o');
        hold on;
     elseif (S(i).id==4)
        plot(S(i).xd,S(i).yd,'b o');
        hold on;
     elseif (S(i).id==5)
        plot(S(i).xd,S(i).yd,'g o');
        hold on;
     elseif (S(i).id==6)
        plot(S(i).xd,S(i).yd,'r o');
        hold on;
     elseif (S(i).id==7)
        plot(S(i).xd,S(i).yd,'r o');
        hold on;
     elseif (S(i).id==8)
        plot(S(i).xd,S(i).yd,'g o');
        hold on;
      elseif (S(i).id==9)
        plot(S(i).xd,S(i).yd,'b o');
        hold on;
     end
     
end

figure(1);
% area(i) defines the number of nodes in all 9 areas
disp('nodes in each area');
for i=1:1:10
disp(area(i));
end
disp('total nodes in all area');
area_all=0; %total number of nodes
for i=1:1:10
area_all=area_all+area(i);
end
disp(area_all);

%Plotting Sink
S(n+1).xd=sink.x;
S(n+1).yd=sink.y;
plot(S(n+1).xd,S(n+1).yd,'^');
hold on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% New Clusters with the Inclusion of Isolated nodes

%Creation of the Sensor Network with new clusters
figure(1);

for i=1:1:9
area_new(i)=0;
end

for i=1:1:n
  X=S();
[C_id_new]= cluster_id_new(X,i);

S(i).id=C_id_new;
%Find the number of nodes in each of 9 areas
% area(i) defines the number of nodes in all 9 areas + Not in any area C=10

if (C_id_new==1)
    area_new(1)=area_new(1)+1;
elseif (C_id_new==2)
    area_new(2)=area_new(2)+1;
elseif (C_id_new==3)
    area_new(3)=area_new(3)+1;
elseif (C_id_new==4)
    area_new(4)=area_new(4)+1;
elseif (C_id_new==5)
    area_new(5)=area_new(5)+1;
elseif (C_id_new==6)
    area_new(6)=area_new(6)+1;
elseif (C_id_new==7)
    area_new(7)=area_new(7)+1;
elseif (C_id_new==8)
    area_new(8)=area_new(8)+1;
elseif (C_id_new==9)
    area_new(9)=area_new(9)+1;
end    
    
        S(i).E=Eo;
        S(i).ENERGY=0;
     if (S(i).id==1)
        plot(S(i).xd,S(i).yd,'g o');
        hold on;
     elseif (S(i).id==2)
        plot(S(i).xd,S(i).yd,'r o');
        hold on;
     elseif (S(i).id==3)
        plot(S(i).xd,S(i).yd,'b o');
        hold on;
     elseif (S(i).id==4)
        plot(S(i).xd,S(i).yd,'b o');
        hold on;
     elseif (S(i).id==5)
        plot(S(i).xd,S(i).yd,'g o');
        hold on;
     elseif (S(i).id==6)
        plot(S(i).xd,S(i).yd,'r o');
        hold on;
     elseif (S(i).id==7)
        plot(S(i).xd,S(i).yd,'r o');
        hold on;
     elseif (S(i).id==8)
        plot(S(i).xd,S(i).yd,'g o');
        hold on;
      elseif (S(i).id==9)
        plot(S(i).xd,S(i).yd,'b o');
        hold on;
     end
     
end

figure(1);
% area(i) defines the number of nodes in all 9 areas
disp('nodes in each area');
for i=1:1:9
disp(area_new(i));
end
disp('total nodes in all area');
area_all=0; %total number of nodes
for i=1:1:9
area_all=area_all+area_new(i);
end
disp(area_all);

%Plotting Sink
S(n+1).xd=sink.x;
S(n+1).yd=sink.y;
plot(S(n+1).xd,S(n+1).yd,'^');
hold on;


X=S();
   
        [C1,C2,C3,C4,C5,C6,C7,C8,C9]=cluster_maker(X,n);
   
   
   
     disp('elegible nodes for cluster1');
       disp(C1);
     disp('elegible nodes for cluster2');
       disp(C2);
     disp('elegible nodes for cluster3');
       disp(C3);
     disp('elegible nodes for cluster4');
       disp(C4);
     disp('elegible nodes for cluster5');
       disp(C5);
     disp('elegible nodes for cluster6');
       disp(C6);
     disp('elegible nodes for cluster7');
       disp(C7);
     disp('elegible nodes for cluster8');
       disp(C8);  
     disp('elegible nodes for cluster9');
       disp(C9);  

figure(1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %%%%%%%%%%%%%%%%%MAke cluster Heads with the help of IDs given to all
   %%%%%%%%%%%%%%%%%nodes according to its area     
%maximum number of rounds
 
dead_all=0;
figure(1);

for rm=0:1:rmax
    rm;
     % Finding Sender nodes in each cluster nodes in senders(i) array
     
       for s1=1:1:9
           rand_val=round(rand(1,1)*10);
        senders(s1)=area_new(s1)-rand_val;
        
%         senders(1)=area(1)-1;
%          senders(2)=area(2)-2;
%           senders(3)=area(3)-3;
%            senders(4)=area(4)-4;
%             senders(5)=area(5)-5;
%              senders(6)=area(6)-6;
%               senders(7)=area(7)-7;
%                senders(8)=area(8)-8;
%                 senders(9)=area(9)-9;
                 
       end
     
       
for i=1:1:n   %After a round setting nodes in the initial position
 
     if (S(i).id==1)
        plot(S(i).xd,S(i).yd,'g o');
        hold on;
     elseif (S(i).id==2)
        plot(S(i).xd,S(i).yd,'r o');
        hold on;
     elseif (S(i).id==3)
        plot(S(i).xd,S(i).yd,'b o');
        hold on;
     elseif (S(i).id==4)
        plot(S(i).xd,S(i).yd,'b o');
        hold on;
     elseif (S(i).id==5)
        plot(S(i).xd,S(i).yd,'g o');
        hold on;
     elseif (S(i).id==6)
        plot(S(i).xd,S(i).yd,'r o');
        hold on;
     elseif (S(i).id==7)
        plot(S(i).xd,S(i).yd,'r o');
        hold on;
     elseif (S(i).id==8)
        plot(S(i).xd,S(i).yd,'g o');
        hold on;
      elseif (S(i).id==9)
        plot(S(i).xd,S(i).yd,'b o');
        hold on;
     end
     
end         
       
       
       
       
       
       
  for r1=1:1:area_new(1)       % Intra Cluster Loop: must be replaced with rounds() defined above 10 is like time or rounds after which we are going to change cluster heads
       
        Routing_pack=Routing_pack+1;
         figure(1);
         
         cha1=C1.nodes(r1);
         if (S(cha1).E<=0)
              disp('node');disp(cha1);disp('is dead, so moving on next node'); 
              break;
         else
         disp('In cluster 1 CH is:');disp(cha1);
         plot(S(cha1).xd,S(cha1).yd,'black +');
         hold on;
         figure(1);
         X=S();
           for g1=1:1:senders(1)  % loop for 1 time data sending
                if (C1.nodes(g1)==cha1)
                    disp('In cluster 1 CH cant be a sender now');
                else
                    if(S(C1.nodes(g1)).E>=0)
                        sender=C1.nodes(g1);
                    else
                        break;
                    end
                
                receiver=cha1;
                [d]=distance(X,sender,receiver); %finding distance between normal nodes and CH (sender & receiver) to implement distance based energy consumption
                [bal_energy_receiver,bal_energy_sender,data_time,data_bytes]=data_send(sender,receiver,X,d);  %communication between Normal node and CH
              
                bytes=bytes+data_bytes;
                
                S(sender).E = bal_energy_sender;
                S(receiver).E = bal_energy_receiver;
                num=senders(1);
                [bal_energy_head]=aggrigation(cha1,X,num); %CH aggrigation energy loss function
                S(receiver).E=bal_energy_head; %Bal energy of CH after aggrigation
                
                end
            end
         end
%        time= time + 1 + d;
        time= time + 1;
           plot(S(cha1).xd,S(cha1).yd,'m o');
           hold on;
   end  
  
  for r1=1:1:area_new(2)       % Intra Cluster Loop: must be replaced with rounds() defined above 10 is like time or rounds after which we are going to change cluster heads
       
        Routing_pack=Routing_pack+1.5;
         figure(1);
         
         cha2=C2.nodes(r1);
         if (S(cha2).E<=0)
              disp('node');disp(cha2);disp('is dead, so moving on next node'); 
              break;
         else
         disp('In cluster 2 CH is:');disp(cha2);
         plot(S(cha2).xd,S(cha2).yd,'black +');
         hold on;
         figure(1);
         X=S();
           for g1=1:1:senders(2)  % loop for 1 time data sending
                if (C2.nodes(g1)==cha2)
                    disp('In cluster 2 CH cant be a sender now');
                else
                    if(S(C2.nodes(g1)).E>=0)
                        sender=C2.nodes(g1);
                    else
                        break;
                    end
                
                receiver=cha2;
                [d]=distance(X,sender,receiver); %finding distance between normal nodes and CH (sender & receiver) to implement distance based energy consumption
                [bal_energy_receiver,bal_energy_sender,data_time,data_bytes]=data_send(sender,receiver,X,d);  %communication between Normal node and CH
              
                bytes=bytes+data_bytes;
                
                S(sender).E = bal_energy_sender;
                S(receiver).E = bal_energy_receiver;
                num=senders(2);
                [bal_energy_head]=aggrigation(cha2,X,num); %CH aggrigation energy loss function
                S(receiver).E=bal_energy_head; %Bal energy of CH after aggrigation
                
                end
            end
         end
%        time= time + 1 + d;
        time= time + 1;
           plot(S(cha2).xd,S(cha2).yd,'m o');
           hold on;
   end  
   
  
 for r1=1:1:area_new(3)       % Intra Cluster Loop: must be replaced with rounds() defined above 10 is like time or rounds after which we are going to change cluster heads
       
        Routing_pack=Routing_pack+1.5;
         figure(1);
         
         cha3=C3.nodes(r1);
         if (S(cha3).E<=0)
              disp('node');disp(cha3);disp('is dead, so moving on next node'); 
              break;
         else
         disp('In cluster 3 CH is:');disp(cha3);
         plot(S(cha3).xd,S(cha3).yd,'black +');
         hold on;
         figure(1);
         X=S();
           for g1=1:1:senders(3)  % loop for 1 time data sending
                if (C3.nodes(g1)==cha3)
                    disp('In cluster 1 CH cant be a sender now');
                else
                    if(S(C3.nodes(g1)).E>=0)
                        sender=C3.nodes(g1);
                    else
                        break;
                    end
                
                receiver=cha3;
                [d]=distance(X,sender,receiver); %finding distance between normal nodes and CH (sender & receiver) to implement distance based energy consumption
                [bal_energy_receiver,bal_energy_sender,data_time,data_bytes]=data_send(sender,receiver,X,d);  %communication between Normal node and CH
              
                bytes=bytes+data_bytes;
                
                S(sender).E = bal_energy_sender;
                S(receiver).E = bal_energy_receiver;
                num=senders(3);
                [bal_energy_head]=aggrigation(cha3,X,num); %CH aggrigation energy loss function
                S(receiver).E=bal_energy_head; %Bal energy of CH after aggrigation
                
                end
            end
         end
%        time= time + 1 + d;
        time= time + 1;
           plot(S(cha3).xd,S(cha3).yd,'m o');
           hold on;
 end
 
 for r1=1:1:area_new(4)       % Intra Cluster Loop: must be replaced with rounds() defined above 10 is like time or rounds after which we are going to change cluster heads
       
        Routing_pack=Routing_pack+1.5;
         figure(1);
         
         cha4=C4.nodes(r1);
         if (S(cha4).E<=0)
              disp('node');disp(cha4);disp('is dead, so moving on next node'); 
              break;
         else
         disp('In cluster 4 CH is:');disp(cha4);
         plot(S(cha4).xd,S(cha4).yd,'black +');
         hold on;
         figure(1);
         X=S();
           for g1=1:1:senders(4)  % loop for 1 time data sending
                if (C4.nodes(g1)==cha4)
                    disp('In cluster 1 CH cant be a sender now');
                else
                    if(S(C4.nodes(g1)).E>=0)
                        sender=C4.nodes(g1);
                    else
                        break;
                    end
                
                receiver=cha4;
                [d]=distance(X,sender,receiver); %finding distance between normal nodes and CH (sender & receiver) to implement distance based energy consumption
                [bal_energy_receiver,bal_energy_sender,data_time,data_bytes]=data_send(sender,receiver,X,d);  %communication between Normal node and CH
              
                bytes=bytes+data_bytes;
                
                S(sender).E = bal_energy_sender;
                S(receiver).E = bal_energy_receiver;
                num=senders(4);
                [bal_energy_head]=aggrigation(cha4,X,num); %CH aggrigation energy loss function
                S(receiver).E=bal_energy_head; %Bal energy of CH after aggrigation
                
                end
            end
         end
%        time= time + 1 + d;
        time= time + 1;
           plot(S(cha4).xd,S(cha4).yd,'m o');
           hold on;
   end  
   
   for r1=1:1:area_new(5)       % Intra Cluster Loop: must be replaced with rounds() defined above 10 is like time or rounds after which we are going to change cluster heads
       
        Routing_pack=Routing_pack+1.5;
         figure(1);
         
         cha5=C5.nodes(r1);
         if (S(cha5).E<=0)
              disp('node');disp(cha5);disp('is dead, so moving on next node'); 
              break;
         else
         disp('In cluster 5 CH is:');disp(cha5);
         plot(S(cha5).xd,S(cha5).yd,'black +');
         hold on;
         figure(1);
         X=S();
           for g1=1:1:senders(5)  % loop for 1 time data sending
                if (C5.nodes(g1)==cha5)
                    disp('In cluster 1 CH cant be a sender now');
                else
                    if(S(C5.nodes(g1)).E>=0)
                        sender=C5.nodes(g1);
                    else
                        break;
                    end
                
                receiver=cha5;
                [d]=distance(X,sender,receiver); %finding distance between normal nodes and CH (sender & receiver) to implement distance based energy consumption
                [bal_energy_receiver,bal_energy_sender,data_time,data_bytes]=data_send(sender,receiver,X,d);  %communication between Normal node and CH
              
                bytes=bytes+data_bytes;
                
                S(sender).E = bal_energy_sender;
                S(receiver).E = bal_energy_receiver;
                num=senders(5);
                [bal_energy_head]=aggrigation(cha5,X,num); %CH aggrigation energy loss function
                S(receiver).E=bal_energy_head; %Bal energy of CH after aggrigation
                
                end
            end
         end
%        time= time + 1 + d;
        time= time + 1;
           plot(S(cha5).xd,S(cha5).yd,'m o');
           hold on;
   end  
   
   for r1=1:1:area_new(6)       % Intra Cluster Loop: must be replaced with rounds() defined above 10 is like time or rounds after which we are going to change cluster heads
       
        Routing_pack=Routing_pack+1.5;
         figure(1);
         
         cha6=C6.nodes(r1);
         if (S(cha6).E<=0)
              disp('node');disp(cha6);disp('is dead, so moving on next node'); 
              break;
         else
         disp('In cluster 6 CH is:');disp(cha6);
         plot(S(cha6).xd,S(cha6).yd,'black +');
         hold on;
         figure(1);
         X=S();
           for g1=1:1:senders(6)  % loop for 1 time data sending
                if (C6.nodes(g1)==cha6)
                    disp('In cluster 1 CH cant be a sender now');
                else
                    if(S(C6.nodes(g1)).E>=0)
                        sender=C6.nodes(g1);
                    else
                        break;
                    end
                
                receiver=cha6;
                [d]=distance(X,sender,receiver); %finding distance between normal nodes and CH (sender & receiver) to implement distance based energy consumption
                [bal_energy_receiver,bal_energy_sender,data_time,data_bytes]=data_send(sender,receiver,X,d);  %communication between Normal node and CH
              
                bytes=bytes+data_bytes;
                
                S(sender).E = bal_energy_sender;
                S(receiver).E = bal_energy_receiver;
                num=senders(6);
                [bal_energy_head]=aggrigation(cha6,X,num); %CH aggrigation energy loss function
                S(receiver).E=bal_energy_head; %Bal energy of CH after aggrigation
                
                end
            end
         end
%        time= time + 1 + d;
        time= time + 1;
           plot(S(cha6).xd,S(cha6).yd,'m o');
           hold on;
   end  
   
   for r1=1:1:area_new(7)       % Intra Cluster Loop: must be replaced with rounds() defined above 10 is like time or rounds after which we are going to change cluster heads
       
        Routing_pack=Routing_pack+1.5;
         figure(1);
         
         cha7=C7.nodes(r1);
         if (S(cha7).E<=0)
              disp('node');disp(cha7);disp('is dead, so moving on next node'); 
              break;
         else
         disp('In cluster 7 CH is:');disp(cha7);
         plot(S(cha7).xd,S(cha7).yd,'black +');
         hold on;
         figure(1);
         X=S();
           for g1=1:1:senders(7)  % loop for 1 time data sending
                if (C7.nodes(g1)==cha7)
                    disp('In cluster 1 CH cant be a sender now');
                else
                    if(S(C7.nodes(g1)).E>=0)
                        sender=C7.nodes(g1);
                    else
                        break;
                    end
                
                receiver=cha7;
                [d]=distance(X,sender,receiver); %finding distance between normal nodes and CH (sender & receiver) to implement distance based energy consumption
                [bal_energy_receiver,bal_energy_sender,data_time,data_bytes]=data_send(sender,receiver,X,d);  %communication between Normal node and CH
              
                bytes=bytes+data_bytes;
                
                S(sender).E = bal_energy_sender;
                S(receiver).E = bal_energy_receiver;
                num=senders(7);
                [bal_energy_head]=aggrigation(cha7,X,num); %CH aggrigation energy loss function
                S(receiver).E=bal_energy_head; %Bal energy of CH after aggrigation
                
                end
            end
         end
%        time= time + 1 + d;
        time= time + 1;
           plot(S(cha7).xd,S(cha7).yd,'m o');
           hold on;
   end  
   
   for r1=1:1:area_new(8)       % Intra Cluster Loop: must be replaced with rounds() defined above 10 is like time or rounds after which we are going to change cluster heads
       
        Routing_pack=Routing_pack+1.5;
         figure(1);
         
         cha8=C8.nodes(r1);
         if (S(cha8).E<=0)
              disp('node');disp(cha8);disp('is dead, so moving on next node'); 
              break;
         else
         disp('In cluster 8 CH is:');disp(cha8);
         plot(S(cha8).xd,S(cha8).yd,'black +');
         hold on;
         figure(1);
         X=S();
           for g1=1:1:senders(8)  % loop for 1 time data sending
                if (C8.nodes(g1)==cha8)
                    disp('In cluster 1 CH cant be a sender now');
                else
                    if(S(C8.nodes(g1)).E>=0)
                        sender=C8.nodes(g1);
                    else
                        break;
                    end
                
                receiver=cha8;
                [d]=distance(X,sender,receiver); %finding distance between normal nodes and CH (sender & receiver) to implement distance based energy consumption
                [bal_energy_receiver,bal_energy_sender,data_time,data_bytes]=data_send(sender,receiver,X,d);  %communication between Normal node and CH
              
                bytes=bytes+data_bytes;
                
                S(sender).E = bal_energy_sender;
                S(receiver).E = bal_energy_receiver;
                num=senders(8);
                [bal_energy_head]=aggrigation(cha8,X,num); %CH aggrigation energy loss function
                S(receiver).E=bal_energy_head; %Bal energy of CH after aggrigation
                
                end
            end
         end
%        time= time + 1 + d;
        time= time + 1;
           plot(S(cha8).xd,S(cha8).yd,'m o');
           hold on;
   end  
   
   for r1=1:1:area_new(9)       % Intra Cluster Loop: must be replaced with rounds() defined above 10 is like time or rounds after which we are going to change cluster heads
       
        Routing_pack=Routing_pack+1.5;
         figure(1);
         
         cha9=C9.nodes(r1);
         if (S(cha9).E<=0)
              disp('node');disp(cha9);disp('is dead, so moving on next node'); 
              break;
         else
         disp('In cluster 9 CH is:');disp(cha9);
         plot(S(cha9).xd,S(cha9).yd,'black +');
         hold on;
         figure(1);
         X=S();
           for g1=1:1:senders(9)  % loop for 1 time data sending
                if (C9.nodes(g1)==cha9)
                    disp('In cluster 9 CH cant be a sender now');
                else
                    if(S(C9.nodes(g1)).E>=0)
                        sender=C9.nodes(g1);
                    else
                        break;
                    end
                
                receiver=cha9;
                [d]=distance(X,sender,receiver); %finding distance between normal nodes and CH (sender & receiver) to implement distance based energy consumption
                [bal_energy_receiver,bal_energy_sender,data_time,data_bytes]=data_send(sender,receiver,X,d);  %communication between Normal node and CH
              
                bytes=bytes+data_bytes;
                
                S(sender).E = bal_energy_sender;
                S(receiver).E = bal_energy_receiver;
                num=senders(9);
                [bal_energy_head]=aggrigation(cha9,X,num); %CH aggrigation energy loss function
                S(receiver).E=bal_energy_head; %Bal energy of CH after aggrigation
                
                end
            end
         end
%        time= time + 1 + d;
        time= time + 1;
           plot(S(cha9).xd,S(cha9).yd,'m o');
           hold on;
   end  
  
end  

    disp('Balance Energy of all the nodes:');
for E2=1:1:n
    disp(S(E2).E);
end

    X=S();
    [dead]=dead_count(X,n);
    disp('dead nodes'); disp(dead);  %number of dead nodes into dead nodes
       
   tput=0;
tput=bytes/time;
Routing_Overhead=Routing_pack/bytes;
bytes=bytes/1000;
time=time/1000;
disp('bytes is:/1000');
disp(bytes);
disp('time is/1000:');
disp(time);
disp('throughput is:');
disp(tput);
disp('Routing_pack is:');
disp(Routing_pack);
disp('Routing_Overhead is:');
disp(Routing_Overhead);


Avg_Bal_Energy=0;
Bal_Energy=0;
Energy=0;
for E1=1:1:n
    if(S(E1).E<=0)
    Energy=0;
    else
     Energy=S(E1).E;
    end
    Bal_Energy=Bal_Energy + Energy;
end

Avg_Bal_Energy = Bal_Energy/n;
disp('Avg_Bal_Energy is:');
disp(Avg_Bal_Energy);
   % we have displayed the nodes and then CHs moving from one node to
   % another one by on
   % all clusters covered
   % insert energy consumption function in it
   % find dead nodes


