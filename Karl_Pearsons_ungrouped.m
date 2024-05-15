function varargout = Karl_Pearsons_ungrouped(varargin)
% KARL_PEARSONS_UNGROUPED MATLAB code for Karl_Pearsons_ungrouped.fig
%      KARL_PEARSONS_UNGROUPED, by itself, creates a new KARL_PEARSONS_UNGROUPED or raises the existing
%      singleton*.
%
%      H = KARL_PEARSONS_UNGROUPED returns the handle to a new KARL_PEARSONS_UNGROUPED or the handle to
%      the existing singleton*.
%
%      KARL_PEARSONS_UNGROUPED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KARL_PEARSONS_UNGROUPED.M with the given input arguments.
%
%      KARL_PEARSONS_UNGROUPED('Property','Value',...) creates a new KARL_PEARSONS_UNGROUPED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Karl_Pearsons_ungrouped_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Karl_Pearsons_ungrouped_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Karl_Pearsons_ungrouped

% Last Modified by GUIDE v2.5 11-Jul-2013 20:16:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Karl_Pearsons_ungrouped_OpeningFcn, ...
                   'gui_OutputFcn',  @Karl_Pearsons_ungrouped_OutputFcn, ...
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


% --- Executes just before Karl_Pearsons_ungrouped is made visible.
function Karl_Pearsons_ungrouped_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Karl_Pearsons_ungrouped (see VARARGIN)
clc;
global i;
i=0;
global a;
for j=1:10
    for k=1:10
        a(j,k)=0;
    end
end
set(handles.uipanel3,'visible','off');


% Choose default command line output for Karl_Pearsons_ungrouped
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Karl_Pearsons_ungrouped wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Karl_Pearsons_ungrouped_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
for j=1:n
    a(j,3)=a(j,1)*a(j,2);
end
v=0;
for j=1:n
    v=v+a(j,3);
end
v1=0;
for j=1:n
    v1=v1+a(j,2);
end
set(handles.text7,'String',v);
set(handles.text5,'String',v1);
set(handles.uitable1,'data',a);
set(handles.pushbutton6,'visible','on');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
for j=1:n
    a(j,4)=a(j,1)*a(j,2)*a(j,1);
end
v=0;
for j=1:n
    v=v+a(j,4);
end
set(handles.text9,'String',v);
set(handles.uitable1,'data',a);
set(handles.pushbutton6,'visible','on');


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=str2double(get(handles.text10,'String'));
y=str2double(get(handles.text11,'String'));
z=str2double(get(handles.text12,'String'));
k=(x-z)/y;
set(handles.text13,'String',k);
if(k>0)
    set(handles.text14,'String','The distribution is positively skewed');
elseif(k<0)
    set(handles.text14,'String','The distribution is negetively skewed');
else
    set(handles.text14,'String','It is symmetric distribution '); 
end



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i;
global a;
n=str2double(get(handles.edit1,'String'));
x=str2double(get(handles.edit2,'String'));
f=str2double(get(handles.edit3,'String'));
if isinteger(n)||isempty(n)||isnan(n)||~isreal(n)||isempty(x)||isnan(x)||~isreal(x)||isempty(f)||isnan(f)||~isreal(f)
    uicontrol(handles.edit2);
    set(handles.edit2,'String','');
    set(handles.edit3,'String','');
    h=msgbox('Enter a valid input','ERROR','error');
else
    i=i+1;
    if(i<=n)
        set(handles.uitable1,'ColumnName',{'X','Frequency','f*x','f*x*x'});
        a(i,1)=str2double(get(handles.edit2,'String'));
        a(i,2)=str2double(get(handles.edit3,'String'));
        
        set(handles.uitable1,'data',a);
        set(handles.edit2,'String','');
        
        set(handles.edit3,'String','');
        uicontrol(handles.edit2);
    end
end
if i>=n
    set(handles.edit1,'Enable','Off');
    set(handles.edit2,'Enable','Off');
    set(handles.edit3,'Enable','Off');
    set(handles.uipanel3,'visible','on');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
fx=str2double(get(handles.text7,'String'));
f=str2double(get(handles.text5,'String'));
m1=fx/f;
set(handles.text10,'String',m1);



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fxx=str2double(get(handles.text9,'String'));
fx=str2double(get(handles.text7,'String'));
n=str2double(get(handles.text5,'String'));
s=(fxx/n)-(fx/n)^2;
sd=sqrt(s);
set(handles.text11,'String',sd);



% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
for i=1:n
    b(i)=a(i,2);
end
pos=0;
x=max(b);
for i=1:n
    if(x==a(i,2))
        pos=i;
    end
end
z=a(pos,1);
set(handles.text12,'String',z);
