% ロボットと人間についてのmutexに与えるstatepairs
% を代入する

function human_area=mutex_robot_human()
filename = ('DESFILE_TEST\mutex_robot1_human.txt');
fileID = fopen(filename);
move = textscan(fileID,'%s %s %s %s','Delimiter',{',','[',']'});
HA1=str2double(move{1,1});
HA2=str2double(move{1,2});
HA3=str2double(move{1,3});
HA4=str2double(move{1,4});
human_area=[HA2,HA3];
end