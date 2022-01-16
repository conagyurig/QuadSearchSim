function [quad1, quad2, quad3, quad4] = break_quad(quada)
    %breaks region down into 4 quadrants and returns coordinates/size of each
    sizex = quada(1);
    sizey = quada(2);
    posx = quada(3);
    posy = quada(4);
    quad1 = [sizex/2, sizey/2, posx,posy];
    quad2 = [sizex/2, sizey/2, posx+(sizex/2),posy];
    quad3 = [sizex/2, sizey/2, posx,posy+(sizey/2)];
    quad4 = [sizex/2, sizey/2, posx+(sizex/2),posy+(sizey/2)];
    
end