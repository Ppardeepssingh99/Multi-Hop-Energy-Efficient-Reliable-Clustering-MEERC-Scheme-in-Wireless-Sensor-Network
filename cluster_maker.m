function [C1,C2,C3,C4,C5,C6,C7,C8,C9]=cluster_maker(S,n)

x1=0; x2=0; x3=0; x4=0; x5=0; x6=0; x7=0; x8=0; x9=0;
for z=1:1:9
if(z==1)
for i=1:1:n
   if (S(i).id==z)
       x1=x1+1;
       C1.nodes(x1)=S(i).name;
    end
end
end

if(z==2)
for i=1:1:n
   if (S(i).id==z)
       x2=x2+1;
       C2.nodes(x2)=S(i).name;
    end
end
end

if(z==3)
for i=1:1:n
   if (S(i).id==z)
       x3=x3+1;
       C3.nodes(x3)=S(i).name;
    end
end
end

if(z==4)
for i=1:1:n
   if (S(i).id==z)
       x4=x4+1;
      C4.nodes(x4)=S(i).name;
    end
end
end

if(z==5)
for i=1:1:n
   if (S(i).id==z)
       x5=x5+1;
       C5.nodes(x5)=S(i).name;
    end
end
end

if(z==6)
for i=1:1:n
   if (S(i).id==z)
       x6=x6+1;
       C6.nodes(x6)=S(i).name;
    end
end
end

if(z==7)
for i=1:1:n
   if (S(i).id==z)
       x7=x7+1;
      C7.nodes(x7)=S(i).name;
    end
end
end


if(z==8)
for i=1:1:n
   if (S(i).id==z)
       x8=x8+1;
       C8.nodes(x8)=S(i).name;
    end
end
end

if(z==9)
for i=1:1:n
   if (S(i).id==z)
       x9=x9+1;
       C9.nodes(x9)=S(i).name;
    end
end
end
end
end