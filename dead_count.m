function [dead]=dead_count(S,n)

dead=0;
figure(1);
for i=1:1:n
    %checking if there is a dead node
    if (S(i).E<=0)
        plot(S(i).xd,S(i).yd,'red .');
        dead=dead+1;
        hold on;    
    end
    if S(i).E>0
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
end
plot(S(n+1).xd,S(n+1).yd,'^');
end