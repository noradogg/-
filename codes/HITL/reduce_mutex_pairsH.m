function reduce_statepairsH=reduce_mutex_pairsH(statepairsH,item_state)
% item�߂���statepairs���폜����
global human;

i=1; % �s��̍s���폜���Ă����D�s���̕ω��ɑΉ����邽�߂̕ϐ�
    for count=1:size(statepairsH,1)
        if statepairsH(i,1)==item_state||mod(statepairsH(i,2),100)==human.help
            statepairsH(i,:)=[];
        else
            i=i+1;
        end
    end
statepairsH=[statepairsH;[item_state,item_state]];
reduce_statepairsH=statepairsH;
end