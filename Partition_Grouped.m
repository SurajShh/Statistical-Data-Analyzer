function varargout = Partition_Grouped(varargin)
% PARTITION_GROUPED MATLAB code for Partition_Grouped.fig
%      PARTITION_GROUPED, by itself, creates a new PARTITION_GROUPED or raises the existing
%      singleton*.
%
%      H = PARTITION_GROUPED returns the handle to a new PARTITION_GROUPED or the handle to
%      the existing singleton*.
%
%      PARTITION_GROUPED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARTITION_GROUPED.M with the given input arguments.
%
%      PARTITION_GROUPED('Property','Value',...) creates a new PARTITION_GROUPED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Partition_Grouped_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Partition_Grouped_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Partition_Grouped

% Last Modified by GUIDE v2.5 02-Jun-2013 19:30:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Partition_Grouped_OpeningFcn, ...
                   'gui_OutputFcn',  @Partition_Grouped_OutputFcn, ...
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


% --- Executes just before Partition_Grouped is made visible.
function Partition_Grouped_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Partition_Grouped (see VARARGIN)
clc;
global i;
i=0;
global a;
for k=1:10;
    for j=1:6
        a(k,j)=0;
    end
end


% Choose default command line output for Partition_Grouped
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Partition_Grouped wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Partition_Grouped_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
a(1,4)=a(1,3);
for i=2:n
    a(i,4)=a(i,3)+a(i-1,4);
end
set(handles.uitable1,'data',a);




% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
N=a(n,4);
set(handles.text25,'String',N);
set(handles.uipanel3,'visible','On');
set(handles.uipanel5,'visible','On');
set(handles.uipanel7,'visible','On');




function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
r=str2double(get(handles.edit5,'String'));
if r>100
    uicontrol(handles.edit5);
    set(handles.edit5,'String','');
    h=msgbox('Percentile range must be less than or equal to 100','Error','error');
else
    %set(handles.uipanel8,'visible','on');
    set(handles.text54,'String',r);
    set(handles.text62,'String',r);
    p=r*a(n,4)/100;
    set(handles.text51,'String',p);
    pos=0;
    for i=1:n
        if(a(i,4)>=p);
            m1=a(i,4);
            pos=i;
            break;
        end
    end
    set(handles.text57,'String',a(pos,1));
    set(handles.text58,'String',a(pos,2));
    c=a(pos,2)-a(pos,1);
    pp=a(pos,1)+((((r*a(n,4)/100))-a(pos-1,4))/a(pos,3))*c;
    set(handles.text60,'String',pp);
end   
    



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
r=str2double(get(handles.edit4,'String'));
if r>10
    uicontrol(handles.edit4);
    set(handles.edit4,'String','');
    h=msgbox('Decile range must be less than or equal to 10','Error','error');
else
    %set(handles.uipanel8,'visible','on');
    set(handles.text41,'String',r);
    set(handles.text49,'String',r);
    p=r*a(n,4)/10;
    set(handles.text38,'String',p);
    pos=0;
    for i=1:n
        if(a(i,4)>=p);
            m1=a(i,4);
            pos=i;
            break;
        end
    end
    set(handles.text44,'String',a(pos,1));
    set(handles.text45,'String',a(pos,2));
    c=a(pos,2)-a(pos,1);
    dd=a(pos,1)+((((r*a(n,4)/10))-a(pos-1,4))/a(pos,3))*c;
    set(handles.text47,'String',dd);
end   
    
    



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
r=str2double(get(handles.edit3,'String'));
if r>3
    uicontrol(handles.edit3);
    set(handles.edit3,'String','');
    h=msgbox('Quartile range must be less than or equal to 3','Error','error');
else
    %set(handles.uipanel8,'visible','on');
    set(handles.text28,'String',r);
    set(handles.text36,'String',r);
    p=r*a(n,4)/4;
    set(handles.text5,'String',p);
    pos=0;
    for i=1:n
        if(a(i,4)>=p);
            m1=a(i,4);
            pos=i;
            break;
        end
    end
    set(handles.text31,'String',a(pos,1));
    set(handles.text32,'String',a(pos,2));
    c=a(pos,2)-a(pos,1);
    qq=a(pos,1)+((((r*a(n,4)/4))-a(pos-1,4))/a(pos,3))*c;
    set(handles.text34,'String',qq);
end   
    
        




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g=str2double(get(hObject,'String'));
if isnan(g)||~isreal(g)||g<=0||rem(g,1)!0
    uicontrol(handles.edit1);
    set(handles.edit1,'String','');
    h=msgbox('Enter a valid input','ERROR','error');
end


% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
n=str2double(get(hObject,'String'));
if isnan(n)||isempty(n)||n<=0||rem(n,1)!0
    uicontrol(handles.edit1);
    set(handles.edit1,'String','');
    h=msgbox('Enter a valid input','ERROR','error');
end

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i;
global a;
n=str2double(get(handles.edit1,'String'));
u=str2double(get(handles.edit2,'String'));
l=str2double(get(handles.edit7,'String'));
f=str2double(get(handles.edit6,'String'));
if isempty(u)||isnan(u)||~isreal(u)||isempty(l)||isnan(l)||~isreal(l)||isempty(f)||isnan(f)||~isreal(f)||u>=l
    uicontrol(handles.edit6);
    set(handles.edit6,'String','');
    set(handles.edit2,'String','');
    set(handles.edit7,'String','');
    h=msgbox('Enter a valid input','ERROR','error');
else
    i=i+1;
    if(i<=n)
        set(handles.uitable1,'ColumnName',{'Lower Limit','Upper Limit','f','LCF',});
        a(i,1)=str2double(get(handles.edit2,'String'));
        a(i,2)=str2double(get(handles.edit7,'String'));
        a(i,3)=str2double(get(handles.edit6,'String'));
        set(handles.uitable1,'data',a);
        set(handles.edit2,'String','');
        set(handles.edit7,'String','');
        set(handles.edit6,'String','');
        uicontrol(handles.edit2);
    end
end
if i>=n
    set(handles.edit2,'Enable','Off');
    set(handles.edit7,'Enable','Off');
    set(handles.edit6,'Enable','Off');
   % set(handles.pushbutton2,'Visible','On');
end



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
