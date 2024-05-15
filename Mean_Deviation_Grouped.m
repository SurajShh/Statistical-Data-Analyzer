function varargout = Mean_Deviation_Grouped(varargin)
% MEAN_DEVIATION_GROUPED MATLAB code for Mean_Deviation_Grouped.fig
%      MEAN_DEVIATION_GROUPED, by itself, creates a new MEAN_DEVIATION_GROUPED or raises the existing
%      singleton*.
%
%      H = MEAN_DEVIATION_GROUPED returns the handle to a new MEAN_DEVIATION_GROUPED or the handle to
%      the existing singleton*.
%
%      MEAN_DEVIATION_GROUPED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEAN_DEVIATION_GROUPED.M with the given input arguments.
%
%      MEAN_DEVIATION_GROUPED('Property','Value',...) creates a new MEAN_DEVIATION_GROUPED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Mean_Deviation_Grouped_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Mean_Deviation_Grouped_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Mean_Deviation_Grouped

% Last Modified by GUIDE v2.5 18-Jul-2013 20:38:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Mean_Deviation_Grouped_OpeningFcn, ...
                   'gui_OutputFcn',  @Mean_Deviation_Grouped_OutputFcn, ...
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


% --- Executes just before Mean_Deviation_Grouped is made visible.
function Mean_Deviation_Grouped_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Mean_Deviation_Grouped (see VARARGIN)
clc;
global i;
i=0;
global a;
for k=1:10;
    for j=1:6
        a(k,j)=0;
    end
end
set(handles.text5,'Visible','Off');
set(handles.text26,'Visible','Off');
set(handles.text47,'Visible','Off');
set(handles.uipanel3,'Visible','off');
set(handles.uipanel5,'Visible','off');
set(handles.uipanel7,'Visible','off');

% Choose default command line output for Mean_Deviation_Grouped
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Mean_Deviation_Grouped wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Mean_Deviation_Grouped_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global i;
clc;
n=str2double(get(handles.edit1,'String'));
for i=1:n
    a(i,4)=(a(i,1)+a(i,2))/2;
    a(i,5)=a(i,6)*0;
    a(i,6)=a(i,6)*0;
    a(i,7)=a(i,7)*0;
    
end 
set(handles.uitable1,'data',a);
set(handles.uitable1,'ColumnName',{'Lower Limit','Upper Limit','f','x','x-Mode','f*(x-Mode)'});


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
for i=1:n
    b(i)=a(i,3);
end
pos=0;
x=max(b);
for i=1:n
    if(x==a(i,3))
        pos=i;
    end
end
n=a(pos,1);
m=a(pos,2);
set(handles.text42,'String',n);
set(handles.text46,'String',m);
c=m-n;
m1=n+[((x-a(pos-1,3))*c)/((2*x)-a(pos-1,3)-a(pos+1,3))];
set(handles.text44,'String',m1);


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
m=str2double(get(handles.text44,'String'));
for j=1:n
    a(j,5)=abs(a(j,4)-m);
end
set(handles.uitable1,'data',a);


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
for j=1:n
    a(j,6)=a(j,3)*a(j,5);
end
set(handles.uitable1,'data',a);
v1=0;
for i=1:n
    v1=v1+a(i,6);
end
set(handles.text36,'String',v1);


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
v=0;
for i=1:n
    v=v+a(i,3);
end
m=str2double(get(handles.text36,'String'));
md=m/v;
set(handles.text37,'String',md);


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m=str2double(get(handles.text37,'String'));
mn=str2double(get(handles.text44,'String'));
cm=m/mn;
set(handles.text38,'String',cm);



% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global i;
clc;
n=str2double(get(handles.edit1,'String'));
for i=1:n
    a(i,4)=(a(i,1)+a(i,2))/2;
    a(i,5)=a(i,6)*0;
    a(i,6)=a(i,6)*0;
    a(i,7)=a(i,7)*0;
end
set(handles.uitable1,'data',a);
set(handles.uitable1,'ColumnName',{'Lower Limit','Upper Limit','f','x','LCF','x-Median','f*(x-Median)'});

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
a(1,5)=a(1,3);
for i=2:n
    a(i,5)=a(i,3)+a(i-1,5);
end
set(handles.uitable1,'data',a);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
v=0;
for i=1:n
    v=v+a(i,3);
end
%
for i=1:n
    b(i)=a(i,3);
end
x=max(b);
for i=1:n
    if(x==a(i,3))
        pos=i;
    end
end
e=a(pos,1);
f=a(pos,2);
b=a(pos,5);
set(handles.text30,'String',e); 
set(handles.text34,'String',f);
z=v;
l=a(pos-1,5);
c=f-e;
m=e+((((z/2)-l)/b)*c);
set(handles.text32,'String',m);        
s=z/2;
set(handles.text28,'String',s);


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
m=str2double(get(handles.text32,'String'));
for j=1:n
    a(j,6)=abs(a(j,4)-m);
end
set(handles.uitable1,'data',a);


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
for j=1:n
    a(j,7)=a(j,3)*a(j,6);
end
set(handles.uitable1,'data',a);
v1=0;
for i=1:n
    v1=v1+a(i,7);
end
set(handles.text23,'String',v1);



% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
v=0;
for i=1:n
    v=v+a(i,3);
end
m=str2double(get(handles.text23,'String'));
md=m/v;
set(handles.text24,'String',md);


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m=str2double(get(handles.text24,'String'));
mn=str2double(get(handles.text32,'String'));
cm=m/mn;
set(handles.text25,'String',cm);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
for i=1:n
    a(i,4)=(a(i,1)+a(i,2))/2;
end
set(handles.uitable1,'data',a);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
for i=1:n
    a(i,5)=a(i,3)*a(i,4);
end
set(handles.uitable1,'data',a);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
v=0;
for i=1:n
    v=v+a(i,3);
end
set(handles.text7,'String',v);
%
v1=0;
for i=1:n
    v1=v1+a(i,5);
end
set(handles.text9,'String',v1);
%
z=v1/v;
set(handles.text11,'String',z);




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
m=str2double(get(handles.text11,'String'));
for j=1:n
    a(j,6)=abs(a(j,4)-m);
end
set(handles.uitable1,'data',a);



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
for j=1:n
    a(j,7)=a(j,3)*a(j,6);
end
set(handles.uitable1,'data',a);
v1=0;
for i=1:n
    v1=v1+a(i,7);
end
set(handles.text13,'String',v1);




% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=str2double(get(handles.text7,'String'));
m=str2double(get(handles.text13,'String'));
md=m/n;
set(handles.text14,'String',md);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m=str2double(get(handles.text14,'String'));
mn=str2double(get(handles.text11,'String'));
cm=m/mn;
set(handles.text15,'String',cm);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=str2double(get(hObject,'String'));
if isnan(n)||isempty(n)||ischar(n)||n<=0||rem(n,1)!0
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


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i;
global a;
n=str2double(get(handles.edit1,'String'));
u=str2double(get(handles.edit2,'String'));
l=str2double(get(handles.edit3,'String'));
f=str2double(get(handles.edit4,'String'));
if isempty(u)||isnan(u)||~isreal(u)||isempty(l)||isnan(l)||~isreal(l)||isempty(f)||isnan(f)||~isreal(f)||u>=l
    uicontrol(handles.edit2);
    set(handles.edit4,'String','');
    set(handles.edit2,'String','');
    set(handles.edit3,'String','');
    h=msgbox('Enter a valid input','ERROR','error');
else
    i=i+1;
    if(i<=n)
        set(handles.uitable1,'ColumnName',{'Lower Limit','Upper Limit','f','x','f*x','x-Mean','f*(x-Mean)'});
        a(i,1)=str2double(get(handles.edit2,'String'));
        a(i,2)=str2double(get(handles.edit3,'String'));
        a(i,3)=str2double(get(handles.edit4,'String'));
        set(handles.uitable1,'data',a);
        set(handles.edit2,'String','');
        set(handles.edit3,'String','');
        set(handles.edit4,'String','');
        uicontrol(handles.edit2);
    end
end
if i>=n
    set(handles.edit2,'Enable','Off');
    set(handles.edit3,'Enable','Off');
    set(handles.edit4,'Enable','Off');
    set(handles.text5,'Visible','On');
    set(handles.text26,'Visible','On');
    set(handles.text47,'Visible','On');
    set(handles.uipanel3,'Visible','On');
    set(handles.uipanel5,'Visible','On');
    set(handles.uipanel7,'Visible','On');
end


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
a(j,5)=0;
set(handles.uitable1,'data',a);


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
