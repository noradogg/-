% �l�Ԃ�human_state�ɂ���Ƃ��́C
% mutex����Ă����ԁi���{�b�g�̏�ԁj�𔲂��o��

function human_area=search_human_area(mutex_statepairs,human_state)

human_area=[NaN];
    for i=1:size(mutex_statepairs,1)
        if mutex_statepairs(i,2)==human_state
            human_area=[human_area;mutex_statepairs(i,1)];
        end
    end
end