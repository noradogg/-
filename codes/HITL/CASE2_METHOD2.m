% 人間がロボットを手伝う
% 方法2

function CASE2_METHOD2()

% Clear and close everything
%clear all; close all; fclose all;

% Run setup.m
setup;

% Set a folder name
init('CASE2_METHOD2');

global robot;
global human;

% Creat G1 (DES)
robot(1).Q = 72; % number of states
       % the initial state q0 is always labeled "0"
robot(1).Qm = (71); % marker state set
robot(1).item=32;
robot(1).delta = [0,15,4;
          4,15,14;
          14,15,24;
          22,15,32;
          23,17,22;
          24,17,23;
          32,109,32; % 108 : load with help of human.
          32,15,42;
          42,13,43;
          43,13,44;
          44,15,54;
          54,15,64;
          64,15,71]; % transition triples (exit state, event, enter state)

% %棚からゴールまでの分岐一つ増やす
% robot(1).delta = [0,15,4;
%           4,15,14;
%           14,15,24;
%           22,15,32;
%           23,17,22;
%           24,17,23;
%           32,108,32; % 108 : load with help of human.
%           32,15,42;
%           41,15,51;%
%           42,17,41;%
%           51,15,61;%
%           61,13,62;%
%           62,13,63;%
%           
%           42,13,43;
%           43,13,44;
%           44,15,54;
%           54,15,64;
%           64,17,63;%
%           63,15,71];%
%           % transition triples (exit state, event, enter state)
          
create('G1', robot(1).Q, robot(1).delta, robot(1).Qm); % create G1

% Creat G2 (DES)
robot(2).Q = 72; % number of states
       % the initial state q0 is always labeled "0"
robot(2).Qm = (71); % marker state set
robot(2).delta = [0,25,6;
         6,27,5;
         5,27,4;
         4,25,14;
         14,25,24;
         24,27,23;
         23,25,33;
         33,25,43;
         43,23,44;
         44,23,45;
         44,25,54;
         45,23,46;
         46,23,47;
         47,25,57;
         54,25,64;
         57,25,67;
         64,23,65;
         65,23,66;
         66,23,67;
         67,23,68;
         68,25,71]; % transition triples (exit state, event, enter state)

create('G2', robot(2).Q, robot(2).delta, robot(2).Qm); % create G2

%Create human1
human.Q = 172; % 31 : waiting at state 31.  73 : helping be completed at state 31. 
human.Qm = (171);
human.help=31;
human.delta = [0,101,66;
           66,107,65;
           65,107,64;
           64,101,54;
           54,101,44;
           44,107,43;
           43,107,42;
           42,107,41;
           64,107,63;
           63,107,62;
           62,107,61;
           61,101,51;
           51,101,41;
           41,101,31;
           31,109,131; % helping be completed
           131,105,141;
           141,103,142;
           142,103,143;
           143,103,144;
           144,105,154;
           154,105,164;
           141,105,151;
           151,105,161;
           161,103,162;
           162,103,163;
           163,103,164;
           164,103,165;
           165,103,166;
           166,105,171];

human.state=[31;
             41;42;43;44;
             51;54;
             61;62;63;64;65;66;
             ];

create('H1', human.Q, human.delta, human.Qm); % create human1


%Synchronous G1,G2 and G3
sync('G', 'G1', 'G2'); % synchronous product by sync
% sync('G', 'G', 'G3');
sync('PLANT', 'G', 'H1');

statepairs = [[1,1];[2,2];[3,3];[4,4];[5,5];[6,6];[7,7];[8,8];[9,9];[10,10];
    [11,11];[12,12];[13,13];[14,14];[15,15];[16,16];[17,17];[18,18];[19,19];[20,20];
    [21,21];[22,22];[23,23];[24,24];[25,25];[26,26];[27,27];[28,28];[29,29];[30,30];
    [31,31];[32,32];[33,33];[34,34];[35,35];[36,36];[37,37];[38,38];[39,39];[40,40];
    [41,41];[42,42];[43,43];[44,44];[45,45];[46,46];[47,47];[48,48];[49,49];[50,50];
    [51,51];[52,52];[53,53];[54,54];[55,55];[56,56];[57,57];[58,58];[59,59];[60,60];
    [61,61];[62,62];[63,63];[64,64];[65,65];[66,66];[67,67];[68,68];[69,69];[70,70]];

% d=1のとき
edge=create_edge(human.state);
statepairsH = create_mutex_pairsH(human.state,edge);
statepairs1H=reduce_mutex_pairsH(statepairsH,robot(1).item);

% % d=2のとき(あってるかわからん)
% edge=create_edge(statepairsH(:,1));
% statepairsH = create_mutex_pairsH(statepairsH(:,1),edge);
% % statepairs1H=reduce_mutex_pairsH(statepairsH,robot(1).item);

%Specifications
mutex('E12', 'G1', 'G2', statepairs);
mutex('E1H', 'G1', 'H1', statepairs1H);
mutex('E2H', 'G2', 'H1', statepairsH);

sync('E', 'E12', 'E1H', 'E2H');

allevents('ALLPLANT', 'PLANT');
sync('SPEC', 'E', 'ALLPLANT');

supcon('SUP', 'PLANT', 'SPEC');

condat('SUPD', 'PLANT', 'SUP');

printdes('SUP');
printdat('SUPD');
end
