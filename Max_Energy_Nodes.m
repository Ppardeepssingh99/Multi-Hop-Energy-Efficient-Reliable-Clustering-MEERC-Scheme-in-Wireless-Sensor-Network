function [M1,M2,M3,M4,M5,M6,M7,M8,M9,X,count, r_pack]=Max_Energy_Nodes(S,n)

x(1)=0; x(2)=0; x(3)=0; x(4)=0; x(5)=0; x(6)=0; x(7)=0; x(8)=0; x(9)=0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Eelec=Etx=Erx 
 ETX=50*0.0000000001;
%ETX=50*0.000000001; 
 ERX=50*0.00000000001;
%ERX=50*0.000000000001;
%Transmit Amplifier types 
 Efs=0.00012*0.00000000000000001;
%Efs=0.015*0.0000000000001;
  Emp=0.0013*0.000000000000000001;
%Emp=0.0013*0.00000000000001;
%Data Aggregation Energy   
EDA=50*0.0000000000001;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
emul=10;


r_pack=0;

for h=1:1:n
   energy_loss =( (Efs)*(emul) + Emp ); 
        S(h).E = S(h).E -  energy_loss;
end 

for z=1:1:9
           
if(z==1)
for i=1:1:n
   if (S(i).E<=0)
        plot(S(i).xd,S(i).yd,'red .');
   else
       if (S(i).id==z)
       x(1)=x(1)+1;
       nodes1(x(1))=S(i).name;
       end
   end  
end
end
 

if(z==2)
for i=1:1:n
    if (S(i).E<=0)
        plot(S(i).xd,S(i).yd,'red .');
    else
       if (S(i).id==z)
       x(2)=x(2)+1;
       nodes2(x(2))=S(i).name;
       end
    end
end
end

if(z==3)
for i=1:1:n
    if (S(i).E<=0)
        plot(S(i).xd,S(i).yd,'red .');
    else
       if (S(i).id==z)
       x(3)=x(3)+1;
       nodes3(x(3))=S(i).name;
       end
    end
end
end

if(z==4)
for i=1:1:n
    if (S(i).E<=0)
        plot(S(i).xd,S(i).yd,'red .');
    else
       if (S(i).id==z)
       x(4)=x(4)+1;
       nodes4(x(4))=S(i).name;
       end
    end
end
end

if(z==5)
for i=1:1:n
    if (S(i).E<=0)
        plot(S(i).xd,S(i).yd,'red .');
    else
       if (S(i).id==z)
       x(5)=x(5)+1;
       nodes5(x(5))=S(i).name;
       end
    end
end
end

if(z==6)
for i=1:1:n
    if (S(i).E<=0)
        plot(S(i).xd,S(i).yd,'red .');
    else
       if (S(i).id==z)
       x(6)=x(6)+1;
       nodes6(x(6))=S(i).name;
       end
    end
end
end

if(z==7)
for i=1:1:n
    if (S(i).E<=0)
        plot(S(i).xd,S(i).yd,'red .');
    else
       if (S(i).id==z)
       x(7)=x(7)+1;
       nodes7(x(7))=S(i).name;
       end
    end
end
end


if(z==8)
for i=1:1:n
    if (S(i).E<=0)
        plot(S(i).xd,S(i).yd,'red .');
    else
       if (S(i).id==z)
       x(8)=x(8)+1;
       nodes8(x(8))=S(i).name;
       end
    end
end
end

if(z==9)
for i=1:1:n
    if (S(i).E<=0)
        plot(S(i).xd,S(i).yd,'red .');
    else
       if (S(i).id==z)
       x(9)=x(9)+1;
       nodes9(x(9))=S(i).name;
       end
    end
end
end
end


              
  

for j=1:1:x(1)-1  %for passes
    % comparing each number with the next and swapping
    for k=1:1:x(1)-j
    if S(nodes1(k)).E < S(nodes1(k+1)).E
       
        temp=nodes1(k);
        nodes1(k)=nodes1(k+1);
        nodes1(k+1)=temp;
        
              
    end
    end
end
r_pack = r_pack+1;

for j=1:1:x(2)-1  %for passes
    % comparing each number with the next and swapping
    for k=1:1:x(2)-j
    if S(nodes2(k)).E < S(nodes2(k+1)).E
       
        temp=nodes2(k);
        nodes2(k)=nodes2(k+1);
        nodes2(k+1)=temp;
       
    end
    end
end
r_pack = r_pack+1;

for j=1:1:x(3)-1  %for passes
    % comparing each number with the next and swapping
    for k=1:1:x(3)-j
    if S(nodes3(k)).E < S(nodes3(k+1)).E
       
        temp=nodes3(k);
        nodes3(k)=nodes3(k+1);
        nodes3(k+1)=temp;
        
    end
    end
end
r_pack = r_pack+1;

for j=1:1:x(4)-1  %for passes
    % comparing each number with the next and swapping
    for k=1:1:x(4)-j
    if S(nodes4(k)).E < S(nodes4(k+1)).E
       
        temp=nodes4(k);
        nodes4(k)=nodes4(k+1);
        nodes4(k+1)=temp;
        
    end
    end
end
r_pack = r_pack+1;

for j=1:1:x(5)-1  %for passes
    % comparing each number with the next and swapping
    for k=1:1:x(5)-j
    if S(nodes5(k)).E < S(nodes5(k+1)).E
       
        temp=nodes5(k);
        nodes5(k)=nodes5(k+1);
        nodes5(k+1)=temp;
    
    end
    end
end
r_pack = r_pack+1;

for j=1:1:x(6)-1  %for passes
    % comparing each number with the next and swapping
    for k=1:1:x(6)-j
    if S(nodes6(k)).E < S(nodes6(k+1)).E
       
        temp=nodes6(k);
        nodes6(k)=nodes6(k+1);
        nodes6(k+1)=temp;
    
       
    end
    end
end
r_pack = r_pack+1;

for j=1:1:x(7)-1  %for passes
    % comparing each number with the next and swapping
    for k=1:1:x(7)-j
    if S(nodes7(k)).E < S(nodes7(k+1)).E
       
        temp=nodes7(k);
        nodes7(k)=nodes7(k+1);
        nodes7(k+1)=temp;
        
      
    end
    end
end
r_pack = r_pack+1;

for j=1:1:x(8)-1  %for passes
    % comparing each number with the next and swapping
    for k=1:1:x(8)-j
    if S(nodes8(k)).E < S(nodes8(k+1)).E
       
        temp=nodes8(k);
        nodes8(k)=nodes8(k+1);
        nodes8(k+1)=temp;
        
       
    end
    end
end
r_pack = r_pack+1;

for j=1:1:x(9)-1  %for passes
    % comparing each number with the next and swapping
    for k=1:1:x(9)-j
    if S(nodes9(k)).E < S(nodes9(k+1)).E
       
        temp=nodes9(k);
        nodes9(k)=nodes9(k+1);
        nodes9(k+1)=temp;
        
        
    end
    end
end
r_pack = r_pack+1;

X=S();
count=x();

if x(1)==0
   nodes1(1)=0;
end
if x(2)==0
    nodes2(1)=0;
end
if x(3)==0
    nodes3(1)=0;
end
if x(4)==0
    nodes4(1)=0;
end
if x(5)==0
    nodes5(1)=0;
end
if x(6)==0
    nodes6(1)=0;
end
if x(7)==0
    nodes7(1)=0;
end
if x(8)==0
    nodes8(1)=0;
end
if x(9)==0
    nodes9(1)=0;
end


   M1= nodes1();
   M2= nodes2();
   M3= nodes3();
   M4= nodes4();
   M5= nodes5();
   M6= nodes6();
   M7= nodes7();
   M8= nodes8();
   M9= nodes9();
end