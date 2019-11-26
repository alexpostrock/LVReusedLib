clear;
%Since MathScript does not support Seed, we do not need to load file

%
%fid=fopen('seeds.txt');
%[S] = fscanf (fid, '%f' , 625);
%fclose(fid);
%

%S=grand('getsd');
%write('seeds.txt',S);

%grand('setsd',S); %not supported yet
y=2*random('bino',1,.5,1,626)-1