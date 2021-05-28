function reduce_statepairsH=reduce_mutex_pairsH(statepairsH,item_state)
% item近くのstatepairsを削除する
global human;

i=1; % 行列の行を削除していく．行数の変化に対応するための変数
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