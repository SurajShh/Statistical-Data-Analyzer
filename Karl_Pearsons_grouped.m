function varargout = Karl_Pearsons_grouped(varargin)
% KARL_PEARSONS_GROUPED MATLAB code for Karl_Pearsons_grouped.fig
%      KARL_PEARSONS_GROUPED, by itself, creates a new KARL_PEARSONS_GROUPED or raises the existing
%      singleton*.
%
%      H = KARL_PEARSONS_GROUPED returns the handle to a new KARL_PEARSONS_GROUPED or the handle to
%      the existing singleton*.
%
%      KARL_PEARSONS_GROUPED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KARL_PEARSONS_GROUPED.M with the given input arguments.
%
%      KARL_PEARSONS_GROUPED('Property','Value',...) creates a new KARL_PEARSONS_GROUPED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Karl_Pearsons_grouped_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Karl_Pearsons_grouped_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Karl_Pearsons_grouped

% Last Modified by GUIDE v2.5 14-Jul-2013 19:17:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Karl_Pearsons_grouped_OpeningFcn, ...
                   'gui_OutputFcn',  @Karl_Pearsons_grouped_OutputFcn, ...
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


% --- Executes just before Karl_Pearsons_grouped is made visible.
function Karl_Pearsons_grouped_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Karl_Pearsons_grouped (see VARARGIN)
clc;
global i;
i=0;
global a;
for k=1:10;
    for j=1:6
        a(k,j)=0;
    end
end
set(handles.uipanel8,'Visible','Off');

% Choose default command line output for Karl_Pearsons_grouped
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Karl_Pearsons_grouped wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Karl_Pearsons_grouped_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit4,'String'));
for j=1:n
    a(j,5)=a(j,4)*a(j,3);
end
set(handles.uitable1,'data',a);
v=0;
for j=1:n
    v=v+a(j,5);
end
set(handles.text26,'String',v);



% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit4,'String'));
for j=1:n
    a(j,6)=a(j,3)*a(j,4)*a(j,4);
end
set(handles.uitable1,'data',a);
v=0;
for j=1:n
    v=v+a(j,3);
end
set(handles.text24,'String',v);
v1=0;
for j=1:n
    v1=v1+a(j,6);
end
set(handles.text28,'String',v1);


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mn=str2double(get(handles.text20,'String'));
sd=str2double(get(handles.text21,'String'));
mo=str2double(get(handles.text22,'String'));
k=(mn-mo)/sd;
set(handles.text18,'String',k);
if(k>0)
    set(handles.text19,'String','The distribution is positively skewed');
elseif(k<0)
    set(handles.text19,'String','The distribution is negetively skewed');
else
    set(handles.text19,'String','It is symmetric distribution '); 
end






function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=str2double(get(hObject,'String'));
if isnan(n)||isempty(n)||ischar(n)||n<=0||rem(n,1)!0
    uicontrol(handles.edit4);
    set(handles.edit4,'String','');
    h=msgbox('Enter a valid input','ERROR','error');
end

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


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i;
global a;
n=str2double(get(handles.edit4,'String'));
u=str2double(get(handles.edit5,'String'));
l=str2double(get(handles.edit7,'String'));
f=str2double(get(handles.edit6,'String'));
if isempty(u)||isnan(u)||~isreal(u)||isempty(l)||isnan(l)||~isreal(l)||isempty(f)||isnan(f)||~isreal(f)||u>=l
    uicontrol(handles.edit5);
    set(handles.edit5,'String','');
    set(handles.edit7,'String','');
    set(handles.edit6,'String','');
    h=msgbox('Enter a valid input','ERROR','error');
else
    i=i+1;
    if(i<=n)
        set(handles.uitable1,'ColumnName',{'Lower Limit','Upper Limit','f','x','f*x','f*x*x'});
        a(i,1)=str2double(get(handles.edit5,'String'));
        a(i,2)=str2double(get(handles.edit7,'String'));
        a(i,3)=str2double(get(handles.edit6,'String'));
        set(handles.uitable1,'data',a);
        set(handles.edit5,'String','');
        set(handles.edit7,'String','');
        set(handles.edit6,'String','');
        uicontrol(handles.edit5);
    end
end
if i>=n
    set(handles.edit5,'Enable','Off');
    set(handles.edit7,'Enable','Off');
    set(handles.edit6,'Enable','Off');
    set(handles.uipanel8,'Visible','On');
%   set(handles.pushbutton2,'Visible','On');
end
%Sset(handles.pushbutton2,'Visible','on');



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


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f=str2double(get(handles.text24,'String'));
fx=str2double(get(handles.text26,'String'));
mn=fx/f;
set(handles.text20,'String',mn);



% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f=str2double(get(handles.text24,'String'));
fx=str2double(get(handles.text26,'String'));
fxx=str2double(get(handles.text28,'String'));
sd=sqrt((fxx/f)-((fx/f)^2));
set(handles.text21,'String',sd);


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit4,'String'));
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
c=m-n;
f1=a(pos-1,3);
f2=a(pos+1,3);
md=n+((x-a(pos-1,3))/((2*x)-a(pos-1,3)-a(pos+1,3)))*c;
set(handles.text22,'String',md);


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit4,'String'));
for j=1:n
    a(j,4)=(a(j,1)+a(j,2))/2;
end
set(handles.uitable1,'data',a);
