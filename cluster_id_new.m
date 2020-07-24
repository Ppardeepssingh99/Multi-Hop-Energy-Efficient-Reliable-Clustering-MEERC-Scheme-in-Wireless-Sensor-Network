function [C]=cluster_id_new(S,i)

disp('********************************************************');
disp('For Node');disp(i);
if(S(i).xd>=0.0 && S(i).xd<=33.00 && S(i).yd>=0.0 && S(i).yd<=33.00)
    disp('C_id=1');
    C=1;
end
if(S(i).xd>=0.0 && S(i).xd<=33.00 && S(i).yd>=33.001 && S(i).yd<=67.0)
    disp('C_id=2');
    C=2;
end
if(S(i).xd>=0.0 && S(i).xd<=33.000 && S(i).yd>=67.001 && S(i).yd<=100.0)
    disp('C_id=3');
    C=3;
end
if(S(i).xd>=33.001 && S(i).xd<=67.000 && S(i).yd>=0.000 && S(i).yd<=33.000)
    disp('C_id=4');
    C=4;
end
if(S(i).xd>=33.001 && S(i).xd<=67.0 && S(i).yd>=33.001 && S(i).yd<=67.000)
    disp('C_id=5');
    C=5;
end
if(S(i).xd>=33.001 && S(i).xd<=67.000 && S(i).yd>=67.001 && S(i).yd<=100.0)
    disp('C_id=6');
    C=6;
end
if(S(i).xd>=67.001 && S(i).xd<=100.0 && S(i).yd>=0.000 && S(i).yd<=33.0)
    disp('C_id=7');
    C=7;
end
if(S(i).xd>=67.1 && S(i).xd<=100.0 && S(i).yd>=33.1 && S(i).yd<=67.0)
    disp('C_id=8');
    C=8;
end
if(S(i).xd>=67.001 && S(i).xd<=100.0 && S(i).yd>=67.001 && S(i).yd<=100.0)
    disp('C_id=9');
    C=9;
end
end