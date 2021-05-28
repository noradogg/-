function varargout = presen3(varargin) 
% TWO_ROBOTS_TEST MATLAB code for TWO_ROBOTS_TEST.fig
%      TWO_ROBOTS_TEST, by itself, creates a new TWO_ROBOTS_TEST or raises the existing
%      singleton*.
%
%      H = TWO_ROBOTS_TEST returns the handle to a new TWO_ROBOTS_TEST or the handle to
%      the existing singleton*.
%
%      TWO_ROBOTS_TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TWO_ROBOTS_TEST.M with the given input arguments.
%
%      TWO_ROBOTS_TEST('Property','Value',...) creates a new TWO_ROBOTS_TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TWO_ROBOTS_TEST_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TWO_ROBOTS_TEST_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TWO_ROBOTS_TEST

% Last Modified by GUIDE v2.5 04-Dec-2020 18:04:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TWO_ROBOTS_TEST_OpeningFcn, ...
                   'gui_OutputFcn',  @TWO_ROBOTS_TEST_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
end

% --- Executes just before TWO_ROBOTS_TEST is made visible.
function TWO_ROBOTS_TEST_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TWO_ROBOTS_TEST (see VARARGIN)

% Choose default command line output for TWO_ROBOTS_TEST
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TWO_ROBOTS_TEST wait for user response (see UIRESUME)
% uiwait(handles.figure1);

x = 10;
y = 9;
shelf = [1,2;
         2,2;
         4,2;
         5,2;
         7,2;
         8,2;
         1,4;
         2,4;
         4,4;
         5,4;
         7,4;
         8,4;
         1,6;
         2,6;
         4,6;
         5,6;
         7,6;
         8,6];

    for i = 1:x
        plot([i,i], [1,y-1], 'k'); 
        hold on;
    end
    
    for i = 0:y
        plot([0,x], [i,i], 'k');
        hold on;
    end
    
    for i = 1:length(shelf)
        rectangle('Position', [shelf(i,1),shelf(i,2),1,1], 'EdgeColor', 'r', 'LineWidth', 3);
        hold on;
    end
    
%     UIset(handles);
end



% --- Outputs from this function are returned to the command line.
function varargout = TWO_ROBOTS_TEST_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global agent; % .  statex, statey, itemx, itemy, goalx, goaly
%global trouble; % statex, statey
global draw_human_area;
global draw_agent;
global draw_item;
global draw_goal;
global draw_trouble;
% draw_robot(1).x = 1;
% draw_robot(1).y = 1;
global robot_num;
global human_num;
robot_num = 2; % ロボットの台数
human_num = 1; % 人間の人数
global agent_num;
agent_num = robot_num + human_num;


% 初期状態（スタート地点
agent(1).statex=5.5;
agent(1).statey=8.5;
agent(2).statex=6.5;
agent(2).statey=8.5;
agent(3).statex=6.5;
agent(3).statey=0.5;

% 商品の場所（経由地点
agent(1).itemx=4.5;
agent(1).itemy=4.5;
agent(2).itemx=8.5;
agent(2).itemy=4.5;

% 受理状態（ゴール地点
agent(1).goalx=3.5;
agent(1).goaly=0.5;
agent(2).goalx=7.5;
agent(2).goaly=0.5;
agent(3).goalx=6.5;
agent(3).goaly=0.5;

% トラブルの場所
trouble.statex=5.5;
trouble.statey=5.5;


draw_agent(1) = plot(agent(1).statex, agent(1).statey, 'o', 'MarkerSize', 18, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
draw_agent(2) = plot(agent(2).statex, agent(2).statey, 'o', 'MarkerSize', 18, 'MarkerEdgeColor', [0 0.9 0], 'MarkerFaceColor',[0 0.9 0]);
draw_agent(3) = plot(agent(3).statex, agent(3).statey, 'd', 'MarkerSize', 14, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k');

draw_item(1) = plot(agent(1).itemx, agent(1).itemy, 's', 'MarkerSize', 16, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
draw_item(2) = plot(agent(2).itemx, agent(2).itemy, 's', 'MarkerSize', 16, 'MarkerEdgeColor', [0 0.9 0], 'MarkerFaceColor', [0 0.9 0]);

draw_goal(1) = plot(agent(1).goalx, agent(1).goaly, 'o', 'MarkerSize', 18, 'MarkerEdgeColor', 'b', 'LineWidth', 2);
draw_goal(2) = plot(agent(2).goalx, agent(2).goaly, 'o', 'MarkerSize', 18, 'MarkerEdgeColor', [0 0.9 0], 'LineWidth', 2);
draw_goal(3) = plot(agent(3).goalx, agent(3).goaly, 'd', 'MarkerSize', 14, 'MarkerEdgeColor', 'k', 'LineWidth', 2);

draw_trouble = plot(trouble.statex, trouble.statey, 'x', 'MarkerSize', 18, 'MarkerEdgeColor', [0.5 0 1], 'MarkerFaceColor', [0.5 0 1], 'LineWidth', 4); % [0.5 0 1] = purple

end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global draw_human_area;
global draw_agent;
global draw_item;
global draw_goal;
global draw_trouble;
global agent;
global robot_num;
global human_num;
global agent_num;
n = 0.02; % Speed
count = 1;

path_string=make_path_presen_3(); % Path_stringは列ベクトル

mutex_statepairsH=mutex_robot_human();

max=length(path_string);

    % スタートからゴールまで
    for des=1:max 

        human_state=(7.5-agent(robot_num+1).statey)*10+agent(robot_num+1).statex+0.5; % Agent(robot_num+1)は人間
        human_area_state=search_human_area(mutex_statepairsH,human_state); % Human_areaはロボットの進入禁止エリア
        if length(human_area_state)~=1
            for i=2:length(human_area_state)
                human.area(i,1)=mod(human_area_state(i)-1,10)+0.5;
                human.area(i,2)=7.5-floor((human_area_state(i)-1)/10);
                draw_human_area(i)=scatter(human.area(i,1),human.area(i,2),500,'s','MarkerFaceColor','r','MarkerEdgeColor','r','MarkerFaceAlpha',.4,'MarkerEdgeAlpha',.4);
            end
        end


        for a=1:agent_num % すべてのagent(・).actをリセット
            agent(a).act=-1;
        end

        for a=1:agent_num % すべてのエージェントのactを決定
            if count>max
                break;
            end
            A=floor(path_string(count,1)/10);
            if A>robot_num
                A=A-9+robot_num;
            end
            if agent(A).act==-1
                agent(A).act=mod(path_string(count,1), 10); % 各エージェントの行動を代入
                count=count+1;
            else
                break;
            end
        end

        % 1マス分動かす
        for i=0:n:1  
            for a=1:agent_num
                switch agent(a).act
                    case 1
                        set(draw_agent(a), 'YData', (agent(a).statey+i));
%                         if a==robot_num+1 & length(human_area)~=1
%                             set(draw_human_area,'YData', (human_area_y + i));
%                         end
                    case 3
                        set(draw_agent(a), 'XData', (agent(a).statex+i));
%                         if a==robot_num+1 & length(human_area)~=1
%                             set(draw_human_area,'XData', (human_area_x + i));
%                         end
                    case 5
                        set(draw_agent(a), 'YData', (agent(a).statey-i));
%                         if a==robot_num+1 & length(human_area)~=1
%                             set(draw_human_area,'YData', (human_area_y - i));
%                         end
                    case 7
                        set(draw_agent(a), 'XData', (agent(a).statex-i));
%                         if a==robot_num+1 & length(human_area)~=1
%                             set(draw_human_area,'XData', (human_area_x - i));
%                         end
                    otherwise
                end
            end

            % human_areaも移動
            if length(human_area_state)~=1
                switch agent(robot_num+1).act
                    case 1
                        for j=2:length(human_area_state)
                            set(draw_human_area(j), 'YData', human.area(j,2)+i);
                        end
                    case 3
                        for j=2:length(human_area_state)
                            set(draw_human_area(j), 'XData', human.area(j,1)+i);
                        end
                    case 5
                        for j=2:length(human_area_state)
                            set(draw_human_area(j), 'YData', human.area(j,2)-i);
                        end
                    case 7
                        for j=2:length(human_area_state)
                            set(draw_human_area(j), 'XData', human.area(j,1)-i);
                        end
                    otherwise
                end
            end
            drawnow;
        end
        for a = 1:agent_num
            switch agent(a).act
%                 case 0
%                     agent(a).statey = agent(a).statey+1;
                case 1
                    agent(a).statey = agent(a).statey+1;
%                 case 2
%                     agent(a).statex = agent(a).statex+1;
                case 3
                    agent(a).statex = agent(a).statex+1;
%                 case 4
%                     agent(a).statey = agent(a).statey-1;
                case 5
                    agent(a).statey = agent(a).statey-1;
%                 case 6
%                     agent(a).statex = agent(a).statex-1;
                case 7
                    agent(a).statex = agent(a).statex-1;
                case 8
                    delete(draw_trouble);
                otherwise
            end
            if agent(a).statex==agent(a).itemx & agent(a).statey==agent(a).itemy
                delete(draw_item(a));
            end
        end
        if length(human_area_state)~=1
            for i=2:length(human_area_state)
                delete(draw_human_area(i));
            end
        end
    end
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

end
