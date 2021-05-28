function edge=create_edge(human_states)
    for i=1:length(human_states)
        edge(i)=0;

        % スタート地点とゴール地点の判定
        if floor((human_states(i,1)-1)/10)==0 % 北（上）がスタート地点
            edge(i)=edge(i)+1000;
        end
        if mod(human_states(i,1),10)==0 % 東（右）が壁
            edge(i)=edge(i)+100;
        end
        if floor((human_states(i,1)-1)/10)==6 % 南（下）がゴール地点
            edge(i)=edge(i)+10;
        end
        if mod(human_states(i,1),10)==1 % 西（左）が壁
            edge(i)=edge(i)+1;
        end
%         if human.state(i,1)==human.help
%             edge(i)=edge(i)+10000;
%         end
    end

end