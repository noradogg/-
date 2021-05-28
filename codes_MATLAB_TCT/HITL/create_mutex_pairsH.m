% Statepairs‚ğŠg’£

function statepairsH=create_mutex_pairsH(human_state,edge) 
% s—ñhuman.state,”z—ñedge‚ªˆø”‚Æ‚³‚ê‚é

statepairsH = [[1,1];[2,2];[3,3];[4,4];[5,5];[6,6];[7,7];[8,8];[9,9];[10,10];
    [11,11];[12,12];[13,13];[14,14];[15,15];[16,16];[17,17];[18,18];[19,19];[20,20];
    [21,21];[22,22];[23,23];[24,24];[25,25];[26,26];[27,27];[28,28];[29,29];[30,30];
    [31,31];[32,32];[33,33];[34,34];[35,35];[36,36];[37,37];[38,38];[39,39];[40,40];
    [41,41];[42,42];[43,43];[44,44];[45,45];[46,46];[47,47];[48,48];[49,49];[50,50];
    [51,51];[52,52];[53,53];[54,54];[55,55];[56,56];[57,57];[58,58];[59,59];[60,60];
    [61,61];[62,62];[63,63];[64,64];[65,65];[66,66];[67,67];[68,68];[69,69];[70,70];
    [1,101];[2,102];[3,103];[4,104];[5,105];[6,106];[7,107];[8,108];[9,109];[10,110];
    [11,111];[12,112];[13,113];[14,114];[15,115];[16,116];[17,117];[18,118];[19,119];[20,120];
    [21,121];[22,122];[23,123];[24,124];[25,125];[26,126];[27,127];[28,128];[29,129];[30,130];
    [31,131];[32,132];[33,133];[34,134];[35,135];[36,136];[37,137];[38,138];[39,139];[40,140];
    [41,141];[42,142];[43,143];[44,144];[45,145];[46,146];[47,147];[48,148];[49,149];[50,150];
    [51,151];[52,152];[53,153];[54,154];[55,155];[56,156];[57,157];[58,158];[59,159];[60,160];
    [61,161];[62,162];[63,163];[64,164];[65,165];[66,166];[67,167];[68,168];[69,169];[70,170]];

    for i=1:length(human_state)
        switch mod(edge(i),10000)
            case 0
                statepairsH=[statepairsH;
                    [human_state(i,1)-10,human_state(i,1)];
                    [human_state(i,1)-10,human_state(i,1)+100];
                    [human_state(i,1)+1,human_state(i,1)];
                    [human_state(i,1)+1,human_state(i,1)+100];
                    [human_state(i,1)+10,human_state(i,1)];
                    [human_state(i,1)+10,human_state(i,1)+100];
                    [human_state(i,1)-1,human_state(i,1)];
                    [human_state(i,1)-1,human_state(i,1)+100]];
            case 1
                statepairsH=[statepairsH;
                    [human_state(i,1)-10,human_state(i,1)];
                    [human_state(i,1)-10,human_state(i,1)+100];
                    [human_state(i,1)+1,human_state(i,1)];
                    [human_state(i,1)+1,human_state(i,1)+100];
                    [human_state(i,1)+10,human_state(i,1)];
                    [human_state(i,1)+10,human_state(i,1)+100]];
            case 10
                statepairsH=[statepairsH;
                    [human_state(i,1)-10,human_state(i,1)];
                    [human_state(i,1)-10,human_state(i,1)+100];
                    [human_state(i,1)+1,human_state(i,1)];
                    [human_state(i,1)+1,human_state(i,1)+100];
                    [human_state(i,1)-1,human_state(i,1)];
                    [human_state(i,1)-1,human_state(i,1)+100]];
            case 11
                statepairsH=[statepairsH;
                    [human_state(i,1)-10,human_state(i,1)];
                    [human_state(i,1)-10,human_state(i,1)+100];
                    [human_state(i,1)+1,human_state(i,1)];
                    [human_state(i,1)+1,human_state(i,1)+100]];
            case 100
                statepairsH=[statepairsH;
                    [human_state(i,1)-10,human_state(i,1)];
                    [human_state(i,1)-10,human_state(i,1)+100];
                    [human_state(i,1)+10,human_state(i,1)];
                    [human_state(i,1)+10,human_state(i,1)+100];
                    [human_state(i,1)-1,human_state(i,1)];
                    [human_state(i,1)-1,human_state(i,1)+100]];
            case 101
                statepairsH=[statepairsH;
                    [human_state(i,1)-10,human_state(i,1)];
                    [human_state(i,1)-10,human_state(i,1)+100];
                    [human_state(i,1)+10,human_state(i,1)];
                    [human_state(i,1)+10,human_state(i,1)+100]];
            case 110
                statepairsH=[statepairsH;
                    [human_state(i,1)-10,human_state(i,1)];
                    [human_state(i,1)-10,human_state(i,1)+100];
                    [human_state(i,1)-1,human_state(i,1)];
                    [human_state(i,1)-1,human_state(i,1)+100]];
            case 111
                statepairsH=[statepairsH;
                    [human_state(i,1)-10,human_state(i,1)];
                    [human_state(i,1)-10,human_state(i,1)+100]];
            case 1000
                statepairsH=[statepairsH;
                    [human_state(i,1)+1,human_state(i,1)];
                    [human_state(i,1)+1,human_state(i,1)+100];
                    [human_state(i,1)+10,human_state(i,1)];
                    [human_state(i,1)+10,human_state(i,1)+100];
                    [human_state(i,1)-1,human_state(i,1)];
                    [human_state(i,1)-1,human_state(i,1)+100]];
            case 1001
                statepairsH=[statepairsH;
                    [human_state(i,1)+1,human_state(i,1)];
                    [human_state(i,1)+1,human_state(i,1)+100];
                    [human_state(i,1)+10,human_state(i,1)];
                    [human_state(i,1)+10,human_state(i,1)+100]];
            case 1010
                statepairsH=[statepairsH;
                    [human_state(i,1)-10,human_state(i,1)];
                    [human_state(i,1)-10,human_state(i,1)+100];
                    [human_state(i,1)+10,human_state(i,1)];
                    [human_state(i,1)+10,human_state(i,1)+100]];
            case 1011
                statepairsH=[statepairsH;
                    [human_state(i,1)+1,human_state(i,1)];
                    [human_state(i,1)+1,human_state(i,1)+100]];
            case 1100
                statepairsH=[statepairsH;
                    [human_state(i,1)+10,human_state(i,1)];
                    [human_state(i,1)+10,human_state(i,1)+100];
                    [human_state(i,1)-1,human_state(i,1)];
                    [human_state(i,1)-1,human_state(i,1)+100]];
            case 1101
                statepairsH=[statepairsH;
                    [human_state(i,1)+10,human_state(i,1)];
                    [human_state(i,1)+10,human_state(i,1)+100]];
            case 1110
                statepairsH=[statepairsH
                    [human_state(i,1)-1,human_state(i,1)];
                    [human_state(i,1)-1,human_state(i,1)+100]];
            case 1111
                
            otherwise
                exit;
        end
    end

end