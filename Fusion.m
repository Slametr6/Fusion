function varargout = Fusion(varargin)
% FUSION MATLAB code for Fusion.fig
%      FUSION, by itself, creates a new FUSION or raises the existing
%      singleton*.
%
%      H = FUSION returns the handle to a new FUSION or the handle to
%      the existing singleton*.
%
%      FUSION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FUSION.M with the given input arguments.
%
%      FUSION('Property','Value',...) creates a new FUSION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Fusion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Fusion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Fusion

% Last Modified by GUIDE v2.5 15-May-2021 11:52:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Fusion_OpeningFcn, ...
                   'gui_OutputFcn',  @Fusion_OutputFcn, ...
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


% --- Executes just before Fusion is made visible.
function Fusion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Fusion (see VARARGIN)

% Choose default command line output for Fusion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Fusion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Fusion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile({'*.jpg';'*.png';'*.*'}) ;
citra1 = imread([pathname, filename]);
axes(handles.axes1);
imshow(citra1);

handles.citraInput1 = citra1;
guidata(hObject,handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile({'*.jpg';'*.png';'*.*'});
citra2 = imread([pathname, filename]);
axes(handles.axes2);
imshow(citra2);

handles.citraInput2 = citra2;
guidata(hObject,handles);

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% panggil kedua citra input
foto1 = handles.citraInput1;
foto2 = handles.citraInput2;

% buat variabel hasil yg dimensinya = citra input
hasil1 = foto1;
hasil2 = foto2;

[m,n] = size(foto1);
bobot = get(handles.slider1,'value');
for x = 1 : m
    for y = 1 : n
        hasil1(x,y) = bobot * foto1(x,y);
        hasil2(x,y) = (1-bobot) * foto2(x,y);
    end
end
hasil = hasil1 + hasil2;
axes(handles.axes3);
imshow(hasil);
