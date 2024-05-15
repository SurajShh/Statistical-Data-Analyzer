function varargout = Mean_Deviation_Ungrouped(varargin)
% MEAN_DEVIATION_UNGROUPED MATLAB code for Mean_Deviation_Ungrouped.fig
%      MEAN_DEVIATION_UNGROUPED, by itself, creates a new MEAN_DEVIATION_UNGROUPED or raises the existing
%      singleton*.
%
%      H = MEAN_DEVIATION_UNGROUPED returns the handle to a new MEAN_DEVIATION_UNGROUPED or the handle to
%      the existing singleton*.
%
%      MEAN_DEVIATION_UNGROUPED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEAN_DEVIATION_UNGROUPED.M with the given input arguments.
%
%      MEAN_DEVIATION_UNGROUPED('Property','Value',...) creates a new MEAN_DEVIATION_UNGROUPED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Mean_Deviation_Ungrouped_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Mean_Deviation_Ungrouped_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Mean_Deviation_Ungrouped

% Last Modified by GUIDE v2.5 27-May-2013 03:59:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Mean_Deviation_Ungrouped_OpeningFcn, ...
                   'gui_OutputFcn',  @Mean_Deviation_Ungrouped_OutputFcn, ...
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


% --- Executes just before Mean_Deviation_Ungrouped is made visible.
function Mean_Deviation_Ungrouped_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Mean_Deviation_Ungrouped (see VARARGIN)
clc;
global i;
i=0;
global a;
for j=1:10
    for k=1:10
        a(j,k)=0;
    end
end
set(handles.text5,'Visible','off');
set(handles.text6,'Visible','off');
set(handles.text7,'Visible','off');
set(handles.uipanel3,'Visible','off');
set(handles.uipanel4,'Visible','off');
set(handles.uipanel5,'Visible','off');


% Choose default command line output for Mean_Deviation_Ungrouped
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Mean_Deviation_Ungrouped wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Mean_Deviation_Ungrouped_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global c;
n=str2double(get(handles.edit1,'String'));
for i=1:n
    b(i)=a(i,1);
end
c=sort(b);
disp(c);
m1=mode(c);
disp(m1);
set(handles.text32,'String',m1);


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
m=str2double(get(handles.text32,'String'));
for j=1:n
    a(j,4)=abs(a(j,1)-m);
end
set(handles.uitable1,'data',a);
v=0;
for j=1:n
    v=v+a(j,4);
end
set(handles.text28,'String',v);


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=str2double(get(handles.edit1,'String'));
m=str2double(get(handles.text28,'String'));
md=m/n;
set(handles.text29,'String',md);


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m=str2double(get(handles.text29,'String'));
mn=str2double(get(handles.text32,'String'));
cmdn=m/mn;
set(handles.text31,'String',cmdn);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
for i=1:n
    b(i)=a(i);
end
m1=median(b);
set(handles.text26,'String',m1);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
m=str2double(get(handles.text26,'String'));
for j=1:n
    a(j,3)=abs(a(j,1)-m);
end
set(handles.uitable1,'data',a);
v=0;
for j=1:n
    v=v+a(j,3);
end
set(handles.text22,'String',v);





% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=str2double(get(handles.edit1,'String'));
m=str2double(get(handles.text22,'String'));
mdn=m/n;
set(handles.text23,'String',mdn);



% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m=str2double(get(handles.text23,'String'));
mn=str2double(get(handles.text26,'String'));
cmdn=m/mn;
set(handles.text25,'String',cmdn);



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
v=0;
for j=1:n
    v=v+a(j,1);
end
set(handles.text9,'String',v);
m=str2double(get(handles.text9,'String'));
mn=m/n;
set(handles.text11,'String',mn);



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
n=str2double(get(handles.edit1,'String'));
m=str2double(get(handles.text11,'String'));
for j=1:n
    a(j,2)=abs(a(j,1)-m);
end
set(handles.uitable1,'data',a);
v=0;
for j=1:n
    v=v+a(j,2);
end
set(handles.text13,'String',v);



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=str2double(get(handles.edit1,'String'));
m=str2double(get(handles.text13,'String'));
md=m/n;
set(handles.text14,'String',md);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m=str2double(get(handles.text14,'String'));
mn=str2double(get(handles.text11,'String'));
cm=m/mn;
set(handles.text16,'String',cm);



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
x1=str2double(get(handles.edit2,'String'));
if isempty(x1)|| isnan(x1)||ischar(x1)||~isreal(x1)
    uicontrol(handles.edit2);
    set(handles.edit2,'String','');
    h=msgbox('Enter a valid input','ERROR','error');
else
    i=i+1;
    if(i<=n)
        set(handles.uitable1,'ColumnName',{'x','x-mean','x-median','x-mode'});
        a(i,1)=x1;
        set(handles.uitable1,'data',a);
        set(handles.edit2,'string','');
        uicontrol(handles.edit2);
    end
end
if i>=n
    set(handles.edit2,'Enable','Off');
    set(handles.pushbutton3,'Visible','on');
    set(handles.text5,'Visible','on');
    set(handles.text6,'Visible','on');
    set(handles.text7,'Visible','on');
    set(handles.uipanel3,'Visible','on');
    set(handles.uipanel4,'Visible','on');
    set(handles.uipanel5,'Visible','on');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
