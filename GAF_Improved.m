% GAF Random + TPut
clc;
      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%
rmax=25; 
data_time=0;
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

%variables for finding max distance between cluster nodes
max_d1=0;max_d2=0;max_d3=0;max_d4=0;max_d5=0;max_d6=0;max_d7=0;max_d8=0;max_d9=0;

%%%%%%%%%%%%%%%%%%%%%%%%% END OF PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%

%Computation of do
do=sqrt(Efs/Emp);

%Creation of the random Sensor Network
figure(1);

for i=1:1:9
area(i)=0;
end

for i=1:1:n
    
    %Getting random initial position of all the nodes
    S(i).xd=rand(1,1)*xm;
    XR(i)=S(i).xd;
    S(i).yd=rand(1,1)*ym;
    YR(i)=S(i).yd;
    
    S(i).name=i;
    
       X=S();
[C_id]= cluster_id(X,i);

S(i).id=C_id;
%Find the number of nodes in each of 9 areas
% area(i) defines the number of nodes in all 9 areas
if (C_id==1)
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
                
        % Plotting all the nodes
     if (S(i).id==1)
        plot(S(i).xd,S(i).yd,'r o');
        hold on;
     elseif (S(i).id==2)
        plot(S(i).xd,S(i).yd,'g o');
        hold on;
     elseif (S(i).id==3)
        plot(S(i).xd,S(i).yd,'m o');
        hold on;
     elseif (S(i).id==4)
        plot(S(i).xd,S(i).yd,'g o');
        hold on;
     elseif (S(i).id==5)
        plot(S(i).xd,S(i).yd,'m o');
        hold on;
     elseif (S(i).id==6)
        plot(S(i).xd,S(i).yd,'r o');
        hold on;
     elseif (S(i).id==7)
        plot(S(i).xd,S(i).yd,'m o');
        hold on;
     elseif (S(i).id==8)
        plot(S(i).xd,S(i).yd,'r o');
        hold on;
      elseif (S(i).id==9)
        plot(S(i).xd,S(i).yd,'g o');
        hold on;
     end
     
  end

figure(1);

disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
% area(i) defines the number of nodes in all 9 areas
disp('nodes in each area');
for i=1:1:9
disp(area(i));
end

disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
%total number of nodes
disp('total nodes in all area');
area_all=0; 
for i=1:1:9
area_all=area_all+area(i);
end
disp(area_all);

%Plotting Sink
S(n+1).xd=sink.x;
S(n+1).yd=sink.y;
plot(S(n+1).xd,S(n+1).yd,'^','linewidth',3);
hold on;
 %cluster on;
 
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('Minimum cluster Size');
min_cluster_size=min(area);
disp(min_cluster_size);

disp('Maximum cluster Size');
max_cluster_size=max(area);
disp(max_cluster_size);

figure(1);


disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
 
        X=S();
   
     [C1,C2,C3,C4,C5,C6,C7,C8,C9]=cluster_maker(X,n);
   
%      disp('nodes for cluster1');
%        disp(C1);
%      disp('nodes for cluster2');
%        disp(C2);
%      disp(' nodes for cluster3');
%        disp(C3);
%      disp('nodes for cluster4');
%        disp(C4);
%      disp('nodes for cluster5');
%        disp(C5);
%      disp('nodes for cluster6');
%        disp(C6);
%      disp('nodes for cluster7');
%        disp(C7);
%      disp('nodes for cluster8');
%        disp(C8);  
%      disp('nodes for cluster9');
%        disp(C9);  
       
       
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

     dead_all=0;  
dead=0;

min_round=3;
for r=1:min_round:rmax
disp('round=');
disp(r);
 if(r>25)
       break;
 end
   
disp ('Nodes after Sorting');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
        X=S();
   
     [M1,M2,M3,M4,M5,M6,M7,M8,M9,S,count, r_pack]=Max_Energy_Nodes(X,n);
     data_time=data_time+1;  
     Routing_pack=Routing_pack + r_pack;    
      disp('sorted nodes for cluster1');       disp(M1);
       for p=1:1:count(1)
            disp(S(M1(p)).E);
       end
%      disp('sorted nodes for cluster2');       disp(M2);
%      disp('sorted nodes for cluster3');       disp(M3);
%      disp('sorted nodes for cluster4');       disp(M4);
%      disp('sorted nodes for cluster5');       disp(M5);
%      disp('sorted nodes for cluster6');       disp(M6);
%      disp('sorted nodes for cluster7');       disp(M7);
%      disp('sorted nodes for cluster8');       disp(M8);  
%      disp('sorted nodes for cluster9');       disp(M9);  
       
figure(1);

   % Selection of 50% nodes after Sorting 
   
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');        
        
y1=0; y2=0; y3=0; y4=0; y5=0; y6=0; y7=0; y8=0; y9=0;

    for i=1:1:9
         t(i) = ceil (count(i) /2); % select the upper roundoff value  for running the loops 
         if t(i)==0
             t(i)=1;
         end
    end

max_round=max(t);

disp('max round');
disp (max_round);

min_round=min(t);

disp('min round');
disp (min_round);


for f1=1:1:min_round
     
   r=r+1;
   disp('round=');
   disp(r);
   if(r>25)
       break;
       disp('break');
   end
        %%%%%%%%%%%%%%%%%%%   Routing_pack=Routing_pack+1;  %%%%%%%%%%%%%
          figure(1);
          X=S();
          if count(1)>0
          active(1)=M1(f1);     %making a node Active Node active(1)
           
          disp('In Grid 1 Active Node is:');disp(active(1));
         plot(S(active(1)).xd,S(active(1)).yd,'o','markerfacecolor','k');
         hold on;
         figure(1);
          end
          
         figure(1);
          X=S();
          if count(2)>0
          active(2)=M2(f1);     %making a node Active Node active(2)
           
%          disp('In Grid 2 Active Node is:');disp(active(2));
         plot(S(active(2)).xd,S(active(2)).yd,'o','markerfacecolor','k');
         hold on;
         figure(1);
          end
    
          figure(1);
          X=S();
          if count(3)>0
          active(3)=M3(f1);     %making a node Active Node active(3)
           
%          disp('In Grid 3 Active Node is:');disp(active(3));
         plot(S(active(3)).xd,S(active(3)).yd,'o','markerfacecolor','k');
         hold on;
         figure(1);
          end
          
          figure(1);
          X=S();
          if count(4)>0
          active(4)=M4(f1);     %making a node Active Node active(4)
           
%          disp('In Grid 4 Active Node is:');disp(active(4));
         plot(S(active(4)).xd,S(active(4)).yd,'o','markerfacecolor','k');
         hold on;
         figure(1);
          end
          
          figure(1);
          X=S();
          if count(5)>0
          active(5)=M5(f1);     %making a node Active Node active(5)
           
%          disp('In Grid 5 Active Node is:');disp(active(5));
         plot(S(active(5)).xd,S(active(5)).yd,'o','markerfacecolor','k');
         hold on;
         figure(1);
          end 
          
          figure(1);
          X=S();
          if count(6)>0
          active(6)=M6(f1);     %making a node Active Node active(6)
           
%          disp('In Grid 6 Active Node is:');disp(active(6));
         plot(S(active(6)).xd,S(active(6)).yd,'o','markerfacecolor','k');
         hold on;
         figure(1);
          end
          
          figure(1);
          X=S();
          if count(7)>0
          active(7)=M7(f1);     %making a node Active Node active(7)
           
%          disp('In Grid 7 Active Node is:');disp(active(7));
         plot(S(active(7)).xd,S(active(7)).yd,'o','markerfacecolor','k');
         hold on;
         figure(1);
          end
          
          figure(1);
          X=S();
          if count(8)>0
          active(8)=M8(f1);     %making a node Active Node active(8)
           
%          disp('In Grid 8 Active Node is:');disp(active(8));
         plot(S(active(8)).xd,S(active(8)).yd,'o','markerfacecolor','k');
         hold on;
         figure(1);
          end 
          
          figure(1);
          X=S();
          if count(9)>0
          active(9)=M9(f1);     %making a node Active Node active(9)
           
%          disp('In Grid 9 Active Node is:');disp(active(9));
         plot(S(active(9)).xd,S(active(9)).yd,'o','markerfacecolor','k');
         hold on;
         figure(1);
          end
          
         X=S();
           for k1=1:1:9
               for k2=1:1:9
                sender=active(k1);
                receiver=active(k2);
                if ((S(sender).xd < S(receiver).xd) && (S(sender).yd < S(receiver).yd))
                    [d]=distance(S,sender,receiver);
                    
                    if(max_d1<d)
                         max_d1=d;
                    end
                    
                    disp('d is');disp(max_d1);
                     [bal_energy_receiver,bal_energy_sender,time,data_bytes]=data_send(sender,receiver,X,max_d1);  %communication between Normal node and CH
                
                      bytes=bytes+data_bytes;
                
                      S(sender).E = bal_energy_sender;
                      S(receiver).E = bal_energy_receiver;
                end
               end
           end
           
            data_time=data_time+1; 
           
          plot(S(active(1)).xd,S(active(1)).yd,'o','markerfacecolor','white');
           hold on;
           
          plot(S(active(2)).xd,S(active(2)).yd,'o','markerfacecolor','white');
           hold on;
           
          plot(S(active(3)).xd,S(active(3)).yd,'o','markerfacecolor','white');
           hold on;
           
          plot(S(active(4)).xd,S(active(4)).yd,'o','markerfacecolor','white');
           hold on;
           
          plot(S(active(5)).xd,S(active(5)).yd,'o','markerfacecolor','white');
           hold on;
           
          plot(S(active(6)).xd,S(active(6)).yd,'o','markerfacecolor','white');
           hold on;
           
          plot(S(active(7)).xd,S(active(7)).yd,'o','markerfacecolor','white');
           hold on;
           
          plot(S(active(8)).xd,S(active(8)).yd,'o','markerfacecolor','white');
           hold on;
           
          plot(S(active(9)).xd,S(active(9)).yd,'o','markerfacecolor','white');
           hold on;
           
           %pause(2);
   
           
end      
r=r+min_round;
%data_time=data_time+1; 
end %loop r=1:1:rmax

disp('Balance Energy of all the nodes:');
for E2=1:1:n
    disp(S(E2).E);
end
   
     X=S();
    [dead]=dead_count(X,n);
    disp('dead nodes'); disp(dead);  %number of dead nodes into dead nodes
         
     total_bal_E=0;
 for i=1:1:n
     if(S(i).E>0)
     total_bal_E = total_bal_E + S(i).E;
     end
 end
    avg_bal_E = total_bal_E/n;
    
    
disp('Average Bal Energy');
disp(avg_bal_E);

      tput=0;
tput=bytes/data_time;
disp('bytes is:');
disp(bytes);
disp('time is:');
disp(data_time);
disp('throughput is:');
disp(tput);
% 
% %disp(S(n+1).xd);
% %disp(S(n+1).yd);
% %disp(S(1));
% %disp(S(2));
% %disp(S(3));
% %a=S(2).xd;
% %b=S(2).yd;
% %display_val(a,b);


r_overhead=0;
r_overhead = Routing_pack/bytes;
disp('r_overhead');
disp(r_overhead);
      
      