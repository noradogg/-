function edge=create_edge(human_states)
    for i=1:length(human_states)
        edge(i)=0;

        % �X�^�[�g�n�_�ƃS�[���n�_�̔���
        if floor((human_states(i,1)-1)/10)==0 % �k�i��j���X�^�[�g�n�_
            edge(i)=edge(i)+1000;
        end
        if mod(human_states(i,1),10)==0 % ���i�E�j����
            edge(i)=edge(i)+100;
        end
        if floor((human_states(i,1)-1)/10)==6 % ��i���j���S�[���n�_
            edge(i)=edge(i)+10;
        end
        if mod(human_states(i,1),10)==1 % ���i���j����
            edge(i)=edge(i)+1;
        end
%         if human.state(i,1)==human.help
%             edge(i)=edge(i)+10000;
%         end
    end

end