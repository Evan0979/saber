/*Editor 類概述
屬性:
initialPath: Future<String> - 初始檔案路徑，可能是提供的或創建的。
needsNaming: bool - 指示是否需要命名檔案。
customTitle: String? - 編輯器的自定義標題。
pdfPath: String? - 要加載的 PDF 文件路徑。
extension: const String - 應用程序使用的文件擴展名（.sbn2）。
extensionOldJson: const String - 應用程序使用的舊文件擴展名（.sbn）。
gapBetweenPages: const double - 頁面之間的間距。
_reservedFilePaths: List<RegExp> - 用於隱藏文件的保留路徑。
canRasterPdf: bool - 指示平台是否可以光柵化 PDF。
方法:
isReservedPath(String path): 檢查給定的路徑是否是保留路徑。
createState(): 為 Editor 小部件創建可變狀態。
EditorState 類概述
屬性:
log: Logger - 用於記錄日誌的實例。
coreInfo: EditorCoreInfo - 編輯器的核心信息。
_canvasGestureDetectorKey: GlobalKey<CanvasGestureDetectorState> - 畫布手勢檢測器的鍵。
_transformationController: TransformationController - 管理變換（如縮放和平移）。
scrollY: double - 計算 Y 軸的滾動位置。
history: EditorHistory - 管理編輯器歷史記錄以進行撤銷/重做操作。
needsNaming: bool - 指示是否需要命名。
_currentTool: Tool - 當前選中的工具。
currentTool: Tool - 當前工具的 getter。
savingState: ValueNotifier<SavingState> - 跟踪保存狀態。
_delayedSaveTimer: Timer? - 用於延遲保存操作的計時器。
lastSeenPointerCount: int - 跟踪上次看到的指針數量。
_lastSeenPointerCountTimer: Timer? - 指針數量跟踪計時器。
quillFocus: ValueNotifier<QuillStruct?> - 管理 Quill 編輯器的焦點狀態。
tmpTool: Tool? - 切換到橡皮擦之前使用的臨時工具。
stylusButtonPressed: bool - 記錄觸控筆按鈕是否被按下。
_ctrlZ, _ctrlY, _ctrlShiftZ: Keybinding? - 撤銷/重做操作的鍵盤快捷鍵。
_filenameFormKey: GlobalKey<FormState> - 文件名輸入表單的鍵。
filenameTextEditingController: TextEditingController - 文件名輸入的控制器。
_renameTimer: Timer? - 延遲重命名操作的計時器。
方法:
initState(): 初始化編輯器的狀態。
_initAsync(): 執行異步初始化。
_assignKeybindings(): 分配撤銷/重做的鍵盤快捷鍵。
_removeKeybindings(): 移除鍵盤快捷鍵。
createPage(int pageIndex): 創建頁面直到給定的頁面索引存在，並且加上一個空白頁面。
removeExcessPages(): 如果頁面是空的，則移除多餘的頁面。
undo([EditorHistoryItem? item]): 執行撤銷操作。
redo(): 執行重做操作。
onWhichPageIsFocalPoint(Offset focalPoint): 確定焦點在哪個頁面上。
onDrawStart(ScaleStartDetails details): 處理繪圖開始事件。
onDrawUpdate(ScaleUpdateDetails details): 處理繪圖更新事件。
onDrawEnd(ScaleEndDetails details): 處理繪圖結束事件。
onInteractionEnd(ScaleEndDetails details): 處理交互結束事件。
onPressureChanged(double? pressure): 處理壓力改變事件。
onStylusButtonChanged(bool buttonPressed): 處理觸控筆按鈕改變事件。
onMoveImage(EditorImage image, Rect offset): 處理圖像移動事件。
onDeleteImage(EditorImage image): 處理圖像刪除事件。
listenToQuillChanges(QuillStruct quill, int pageIndex): 監聽 Quill 編輯器的更改。
_onQuillFocusChange(): 處理 Quill 編輯器的焦點改變。
_addQuillChangeToHistory(...): 將 Quill 更改添加到歷史記錄中。
autosaveAfterDelay(): 在延遲後自動保存。
saveToFile(): 將文件保存到磁碟。
renameFile([String? _]): 延遲重命名文件。
_renameFileNow(): 執行實際的重命名操作。
_validateFilenameTextField(String? newName): 驗證文件名輸入。
updateColorBar(Color color): 使用給定的顏色更新顏色欄。
_pickPhotos([List<_PhotoInfo>? photoInfos]): 提示用戶從設備中選擇照片。
_pickPhotosWithFilePicker(): 使用文件選擇器選擇照片。
importPdf(): 提示用戶選擇要導入的 PDF。
importPdfFromFilePath(String path): 從給定的文件路徑導入 PDF。
paste(): 從剪貼板粘貼內容。
exportAsPdf(BuildContext context): 將當前筆記導出為 PDF 文件。
exportAsSba(BuildContext context): 將當前筆記導出為 SBA (Saber Archive) 文件。
setAndroidNavBarColor(): 設置 Android 導航欄顏色。
build(BuildContext context): 構建小部件樹。
snackBarNeedsToSaveBeforeExiting(): 顯示提示需要在退出前保存的 Snackbar。
bottomSheet(BuildContext context): 構建底部選單以提供附加選項。
pageBuilder(BuildContext context, int pageIndex): 為特定頁面構建畫布。
pagePreviewBuilder(...): 為特定頁面構建預覽。
pageManager(BuildContext context): 管理編輯器中的頁面。
insertPageAfter(int pageIndex): 在指定頁面索引之後插入新頁面。
clearPage(int pageIndex): 清除指定頁面的內容。
clearAllPages(): 清除所有頁面的內容。
askUserToDisableReadOnly(): 提示用戶禁用只讀模式。
getPageIndexFromScrollPosition(...): 從滾動位置獲取頁面索引。
dispose(): 釋放資源並執行清理。
常量:
extension: .sbn2
extensionOldJson: .sbn
gapBetweenPages: 16.0
小部件:
CanvasGestureDetector: 檢測畫布交互手勢。
Toolbar: 包含編輯器的工具和操作。
SaveIndicator: 顯示保存狀態。
AdaptiveAlertDialog: 顯示提示對話框。
AppBar: 顯示應用程序欄。
Scaffold: 提供編輯器 UI 的結構。
Form: 處理文件名輸入表單。
TextFormField: 允許文件名輸入。*/

import 'dart:async';//異步編程
import 'dart:convert';//數據轉換功能
import 'dart:io';//處理檔案、目錄、程序、套接字、Webstockets以及HTTP客戶端和伺服器

import 'package:collapsible/collapsible.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart' as flutter_quill;
import 'package:keybinder/keybinder.dart';
import 'package:logging/logging.dart';
import 'package:printing/printing.dart';
import 'package:saber/ChatGPT.dart';
import 'package:saber/components/canvas/_asset_cache.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/canvas.dart';
import 'package:saber/components/canvas/canvas_gesture_detector.dart';
import 'package:saber/components/canvas/canvas_image.dart';
import 'package:saber/components/canvas/canvas_preview.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/components/canvas/save_indicator.dart';
import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/components/toolbar/color_bar.dart';
import 'package:saber/components/toolbar/editor_bottom_sheet.dart';
import 'package:saber/components/toolbar/editor_page_manager.dart';
import 'package:saber/components/toolbar/toolbar.dart';
import 'package:saber/data/editor/_color_change.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/editor_exporter.dart';
import 'package:saber/data/editor/editor_history.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/extensions/change_notifier_extensions.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/eraser.dart';
import 'package:saber/data/tools/highlighter.dart';
import 'package:saber/data/tools/laser_pointer.dart';
import 'package:saber/data/tools/pen.dart';
import 'package:saber/data/tools/pencil.dart';
import 'package:saber/data/tools/select.dart';
import 'package:saber/data/tools/shape_pen.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/home/whiteboard.dart';
import 'package:screenshot/screenshot.dart';
import 'package:super_clipboard/super_clipboard.dart';


typedef _PhotoInfo = ({Uint8List bytes, String extension});//圖像數據和對應的文件擴展名

class Editor extends StatefulWidget {
  Editor({
    super.key, // 接收一個 key 參數，用於控制框架將在 widget 樹中的位置
    String? path, // 可選的路徑參數，用於指定文件的初始路徑，可以為 null
    this.customTitle, // 自定義標題，成員變量直接在構造函數中通過 this 關鍵字初始化
    this.pdfPath, // 可選的 PDF 路徑參數，用於加載 PDF 文件
  })  : initialPath =
            path != null ? Future.value(path) : FileManager.newFilePath('/'),        //如果提供了 path 參數，initialPath 將被設置為該路徑的 Future；
  // 如果沒有提供 path 參數，將調用 FileManager.newFilePath 創建一個新的路徑
        needsNaming = path == null;// 如果 path 為 null，表示需要對文件進行命名

  final Future<String> initialPath; // 用於存儲文件的初始路徑，是一個異步的 Future 類型
  final bool needsNaming; // 一個布爾值，用於指示是否需要用戶為文件命名

  final String? customTitle; // 自定義標題，可以為空（null），用於顯示在編輯器或相關界面上
  final String? pdfPath; //PDF 文件的路徑，可為空，用於指定加載的 PDF 文件

  /// The file extension used by the app.
  /// Files with this extension are
  /// encoded in BSON format.
  static const String extension = '.sbn2';

  /// The old file extension used by the app.
  /// Files with this extension are
  /// encoded in JSON format.
  static const String extensionOldJson = '.sbn';

  static const double gapBetweenPages = 16;// 頁面間的間隙，用於佈局或顯示時定義頁面之間的距離

  /// Returns true if [path] belongs to a hidden file
  /// used by other functions of the app
  static bool isReservedPath(String path) {
    return _reservedFilePaths.any((regex) => regex.hasMatch(path));
  }

  static final List<RegExp> _reservedFilePaths = [
    RegExp(RegExp.escape(Whiteboard.filePath)),
  ];//egExp（正則表達式）(RegExp（正則表達式）。

  /// Whether the platform can rasterize a pdf
  static bool canRasterPdf = true;//PDF光柵化能力

  @override// @override 注解，重寫父類或接口中的方法
  State<Editor> createState() => EditorState();
}
// EditorState 類繼承自 State<Editor>，專門為 Editor 組件管理狀態
class EditorState extends State<Editor> {
  bool _isSearchOpen = false;
  final log = Logger('EditorState');// 使用 Logger 工具紀錄日誌

  late EditorCoreInfo coreInfo = EditorCoreInfo(filePath: '');// 延遲初始化，用於存儲編輯核心信息

  final _canvasGestureDetectorKey = GlobalKey<CanvasGestureDetectorState>();
  late final TransformationController _transformationController =
      TransformationController()// 用於管理變換操作，如縮放和平移
        ..addListener(() {
          PdfEditorImage.checkIfHighDpiNeeded(
            getZoom: () => _transformationController.value.getMaxScaleOnAxis(),
            getScrollY: () => scrollY,
            pages: coreInfo.pages,
            screenWidth: _canvasGestureDetectorKey
                    .currentState?.containerBounds.maxWidth ??
                double.infinity,
          );
        });
  // 計算滾動的 Y 坐標，用於處理使用者介面的滾動行為
  double get scrollY {
    final transformation = _transformationController.value;
    final scale = transformation.getMaxScaleOnAxis();
    final translation = transformation.getTranslation();
    final gestureDetector = _canvasGestureDetectorKey.currentState;

    if (gestureDetector == null) {
      log.warning('scrollY: Could not find CanvasGestureDetectorState');
      return translation.y / scale;
    } else {
      final middle = gestureDetector.containerBounds.maxHeight / 2;
      return (translation.y - middle) / scale + middle;
    }
  }

  EditorHistory history = EditorHistory();// 創建一個 EditorHistory 實例，用於管理和記錄編輯器的歷史操作，詳細看data

  late bool needsNaming = widget.needsNaming && Prefs.editorPromptRename.value;// 根據配置和 widget 的屬性來決定是否需要命名，看prefs.dart
// 根據用戶上次使用的工具來初始化當前工具
  late Tool _currentTool = () {
    switch (Prefs.lastTool.value) {// 根據保存的上次工具偏好設置來選擇工具
      case ToolId.fountainPen:
        if (Pen.currentPen.toolId != Prefs.lastTool.value) {//檢查當前鋼筆是否已是選中的工具
          Pen.currentPen = Pen.fountainPen();// 如果不是，更新為新的鋼筆實例
        }
        return Pen.currentPen;
      case ToolId.ballpointPen://圓珠筆
        if (Pen.currentPen.toolId != Prefs.lastTool.value) {
          Pen.currentPen = Pen.ballpointPen();
        }
        return Pen.currentPen;
      case ToolId.shapePen://形狀筆
        if (Pen.currentPen.toolId != Prefs.lastTool.value) {
          Pen.currentPen = ShapePen();
        }
        return Pen.currentPen;
      case ToolId.highlighter:// 螢光筆
        return Highlighter.currentHighlighter;
      case ToolId.pencil://鉛筆
        return Pencil.currentPencil;
      case ToolId.eraser://橡皮擦
        return Eraser();
      case ToolId.select://選擇工具
        return Select.currentSelect;
      case ToolId.textEditing://文字編輯工具。
        return Tool.textEditing;
      case ToolId.laserPointer://激光指示器。
        return LaserPointer.currentLaserPointer;
    }
  }();// 獲取当前工具。
  Tool get currentTool => _currentTool;

  set currentTool(Tool tool) {//設置當前工具，並更新偏好設置中的上次工具
    _currentTool = tool;
    Prefs.lastTool.value = tool.toolId;
  }

  ValueNotifier<SavingState> savingState = ValueNotifier(SavingState.saved);//ValueNotifier 是一个工具，可以帮助你追踪变量的变化，并且当变量改变时自动更新界面。这段代码中的 ValueNotifier 用来监视保存状态，当状态改变时，界面上相关的部分就会自动更新。
  Timer? _delayedSaveTimer;//延遲保存操作的計時器

  // used to prevent accidentally drawing when pinch zooming
  int lastSeenPointerCount = 0;
  Timer? _lastSeenPointerCountTimer;

  ValueNotifier<QuillStruct?> quillFocus = ValueNotifier(null);// 使用 ValueNotifier 來管理 Quill 編輯器的焦點狀態

  /// The tool that was used before switching to the eraser.
  Tool? tmpTool;// 記錄使用橡皮擦之前使用的工具

  /// If the stylus button is pressed, or was pressed during the current draw gesture.
  bool stylusButtonPressed = false;//記錄觸控筆按鈕是否被按下，或在當前繪畫手勢期間是否被按下
  @override
  void initState() {//widget 的生命周期中首次創建时調用。
    DynamicMaterialApp.addFullscreenListener(_setState);// 添加全屏監聽器，當全屏狀態改變時更新 UI（set state）

    _initAsync();//進行異步初始化操作（這種類型的函數通常用於加載數據、初始化服務或執行其他可能需要等待完成的任務）
    _assignKeybindings();// 分配鍵盤快捷鍵

    super.initState();
  }

  void _initAsync() async {
    coreInfo.filePath = await widget.initialPath;// 異步獲取初始文件路徑
    filenameTextEditingController.text = coreInfo.fileName;// 界面上的文本框（TextField）中顯示的內容設置為當前文件的名字

    if (needsNaming) {
      filenameTextEditingController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: filenameTextEditingController.text.length,
      );
    }

    await _initStrokes();//初始化筆劃數據

    if (widget.pdfPath != null) {//導入 PDF 文件
      await importPdfFromFilePath(widget.pdfPath!);
    }
  }

  Future _initStrokes() async {// 異步方法，用於初始化涉及到筆跡的所有數據和狀態
    coreInfo = await EditorCoreInfo.loadFromFilePath(coreInfo.filePath);  // 從文件路徑加載編輯器核心信息
    if (coreInfo.readOnly) {
      log.info('Loaded file as read-only');// 如果文件是只讀的，記錄信息
    }

    for (int pageIndex = 0; pageIndex < coreInfo.pages.length; pageIndex++) {  // 遍歷所有頁面，為每個頁面的 Quill 編輯器設置變更監聽
      listenToQuillChanges(coreInfo.pages[pageIndex].quill, pageIndex);
    }

    if (coreInfo.isEmpty) {  // 如果核心信息指示沒有內容，創建一個新頁面；否則，為每個頁面上的背景圖片和圖片設置事件處理
      createPage(-1);// 創建一個新頁面
    } else {
      for (EditorPage page in coreInfo.pages) {
        page.backgroundImage?.onMoveImage = onMoveImage;
        page.backgroundImage?.onDeleteImage = onDeleteImage;
        page.backgroundImage?.onMiscChange = autosaveAfterDelay;
        for (EditorImage image in page.images) {
          image.onMoveImage = onMoveImage;
          image.onDeleteImage = onDeleteImage;
          image.onMiscChange = autosaveAfterDelay;
        }
      }
    }

    if (currentTool == Tool.textEditing) { //如果當前工具是文本編輯，嘗試設置焦點到初始頁面的 Quill 編輯器
      int pageIndex;
      if (coreInfo.initialPageIndex != null) {
        pageIndex = coreInfo.initialPageIndex!;
      } else {
        pageIndex = 0;
      }
      assert(pageIndex < coreInfo.pages.length);

      quillFocus.value = coreInfo.pages[pageIndex].quill
        ..focusNode.requestFocus();
    }
// 如果文件路徑是白板的路徑，並且設置了退出時自動清除白板，執行清除操作
    if (coreInfo.filePath == Whiteboard.filePath &&
        Prefs.autoClearWhiteboardOnExit.value &&
        Whiteboard.needsToAutoClearWhiteboard) {
      // clear whiteboard (and add to history)
      clearAllPages();// 清除所有頁面

      // save cleared whiteboard
      await saveToFile();// 保存文件
      Whiteboard.needsToAutoClearWhiteboard = false;
    } else {
      setState(() {});// 刷新狀態
    }
  }

  void _setState() => setState(() {});

  Keybinding? _ctrlZ, _ctrlY, _ctrlShiftZ;// 定義三個鍵盤快捷鍵變量：撤銷、重做（兩種組合）
  void _assignKeybindings() {// 設置鍵盤快捷键
    _ctrlZ = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyZ)],
        inclusive: true);
    _ctrlY = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyY)],
        inclusive: true);
    _ctrlShiftZ = Keybinding(
        [KeyCode.ctrl, KeyCode.shift, KeyCode.from(LogicalKeyboardKey.keyZ)],
        inclusive: true);
    Keybinder.bind(_ctrlZ!, undo);  // 使用 Keybinder 工具將快捷鍵與對應的撤銷和重做函數綁定
    Keybinder.bind(_ctrlY!, redo);
    Keybinder.bind(_ctrlShiftZ!, redo);
  }

  void _removeKeybindings() {// 移除設置的鍵盤快捷键。
    if (_ctrlZ != null) Keybinder.remove(_ctrlZ!);
    if (_ctrlY != null) Keybinder.remove(_ctrlY!);
    if (_ctrlShiftZ != null) Keybinder.remove(_ctrlShiftZ!);
  }

  /// Creates pages until the given page index exists,
  /// plus an extra blank page
  void createPage(int pageIndex) {
    while (pageIndex >= coreInfo.pages.length - 1) {  // 如果需要的頁面索引大於等於現有頁面數量，繼續添加頁面
      final page = EditorPage();
      coreInfo.pages.add(page);
      listenToQuillChanges(page.quill, coreInfo.pages.length - 1);
    }
  }

  void removeExcessPages() {
    bool removedAPage = false;

    // remove excess pages if all pages >= this one are empty
    for (int i = coreInfo.pages.length - 1; i >= 1; --i) {
      final thisPage = coreInfo.pages[i];
      final prevPage = coreInfo.pages[i - 1];
      if (thisPage.isEmpty && prevPage.isEmpty) {
        EditorPage page = coreInfo.pages.removeAt(i);
        page.dispose();
        removedAPage = true;
      } else {
        break;
      }
    }

    if (removedAPage) {//移除多餘的頁面
      // scroll to the last page (only if we're below the last page)

      final scrollY = this.scrollY;
      late final topOfLastPage = -CanvasGestureDetector.getTopOfPage(
        pageIndex: coreInfo.pages.length - 1,
        pages: coreInfo.pages,
        screenWidth: MediaQuery.sizeOf(context).width,
      );
      final bottomOfLastPage = -CanvasGestureDetector.getTopOfPage(
        pageIndex: coreInfo.pages.length,
        pages: coreInfo.pages,
        screenWidth: MediaQuery.sizeOf(context).width,
      );

      if (scrollY < bottomOfLastPage) {
        _transformationController.value = Matrix4.translationValues(
          0,
          // Slight upwards offset so that the page is not flush with the top of the screen
          topOfLastPage + 50,
          0,
        );
      }
    }
  }

  void undo([EditorHistoryItem? item]) {
    if (item == null) {//檢查和處理撤銷操作
      if (!history.canUndo) return;

      // if we disabled redo, re-enable it
      if (!history.canRedo) {
        // no redo is possible, so clear the redo stack
        history.clearRedo();
        // don't disable redoing anymore
        history.canRedo = true;
      }

      item = history.undo();
    }

    setState(() {//根據歷史項目的類型進行對應的撤銷操作
      switch (item!.type) {
        case EditorHistoryItemType.draw:
          for (Stroke stroke in item.strokes) {
            coreInfo.pages[stroke.pageIndex].strokes.remove(stroke);
          }
          for (EditorImage image in item.images) {
            coreInfo.pages[image.pageIndex].images.remove(image);
          }
          removeExcessPages();

        case EditorHistoryItemType.erase:
          for (Stroke stroke in item.strokes) {
            createPage(stroke.pageIndex);
            coreInfo.pages[stroke.pageIndex].insertStroke(stroke);
          }
          for (EditorImage image in item.images) {
            createPage(image.pageIndex);
            coreInfo.pages[image.pageIndex].images.add(image);
            image.newImage = true;
          }

        case EditorHistoryItemType.deletePage:
          // make sure we already have a (blank/otherwise) page at this index
          createPage(item.pageIndex - 1);

          // insert the page at the correct index
          coreInfo.pages.insert(item.pageIndex, item.page!);

          // fix the page indices of all pages after this one
          for (int i = item.pageIndex + 1; i < coreInfo.pages.length; ++i) {
            final page = coreInfo.pages[i];
            for (Stroke stroke in page.strokes) {
              stroke.pageIndex = i;
            }
            for (EditorImage image in page.images) {
              image.pageIndex = i;
            }
            page.backgroundImage?.pageIndex = i;
          }

        case EditorHistoryItemType.insertPage:
          // remove the page at the given index
          coreInfo.pages.removeAt(item.pageIndex);

          // fix the page indices of all pages after this one
          for (int i = item.pageIndex; i < coreInfo.pages.length; ++i) {
            final page = coreInfo.pages[i];
            for (Stroke stroke in page.strokes) {
              stroke.pageIndex = i;
            }
            for (EditorImage image in page.images) {
              image.pageIndex = i;
            }
            page.backgroundImage?.pageIndex = i;
          }

        case EditorHistoryItemType.move:
          for (Stroke stroke in item.strokes) {
            stroke.shift(Offset(
              -item.offset!.left,
              -item.offset!.top,
            ));
          }
          Select select = Select.currentSelect;
          if (select.doneSelecting) {
            select.selectResult.path = select.selectResult.path.shift(Offset(
              -item.offset!.left,
              -item.offset!.top,
            ));
          }
          for (EditorImage image in item.images) {
            image.dstRect = Rect.fromLTRB(
              image.dstRect.left - item.offset!.left,
              image.dstRect.top - item.offset!.top,
              image.dstRect.right - item.offset!.right,
              image.dstRect.bottom - item.offset!.bottom,
            );
          }

        case EditorHistoryItemType.quillChange:
          final quill = coreInfo.pages[item.pageIndex].quill;
          quill.controller.undo();

        case EditorHistoryItemType.quillUndoneChange:
          final quill = coreInfo.pages[item.pageIndex].quill;
          quill.controller.redo();
        case EditorHistoryItemType.changeColor:
          for (Stroke stroke in item.strokes) {
            stroke.color = item.colorChange![stroke]!.previous;
          }
      }

      if (item.type != EditorHistoryItemType.move) {
        Select.currentSelect.unselect();
      }
    });

    autosaveAfterDelay();
  }

  void redo() {
    if (!history.canRedo) return;
    EditorHistoryItem item = history.redo();

    switch (item.type) {
      case EditorHistoryItemType.draw://繪製操作
        undo(item.copyWith(type: EditorHistoryItemType.erase));
      case EditorHistoryItemType.erase://擦除操作
        undo(item.copyWith(type: EditorHistoryItemType.draw));
      case EditorHistoryItemType.deletePage://刪除頁面
        undo(item.copyWith(type: EditorHistoryItemType.insertPage));
      case EditorHistoryItemType.insertPage://插入頁面
        undo(item.copyWith(type: EditorHistoryItemType.deletePage));
      case EditorHistoryItemType.move://移動操作
        undo(item.copyWith(
            offset: Rect.fromLTRB(
          -item.offset!.left,
          -item.offset!.top,
          -item.offset!.right,
          -item.offset!.bottom,
        )));
      case EditorHistoryItemType.quillChange://Quill 操作
        undo(item.copyWith(type: EditorHistoryItemType.quillUndoneChange));
      case EditorHistoryItemType.quillUndoneChange: // this will never happen
        throw Exception('history should not contain quillUndoneChange items');
      case EditorHistoryItemType.changeColor://顏色更改
        undo(item.copyWith(
            colorChange: item.colorChange!
                .map((key, value) => MapEntry(key, value.swap()))));
    }
  }

  int? onWhichPageIsFocalPoint(Offset focalPoint) {
    for (int i = 0; i < coreInfo.pages.length; ++i) {
      if (coreInfo.pages[i].renderBox == null) continue;
      Rect pageBounds = Offset.zero & coreInfo.pages[i].size;
      if (pageBounds.contains(
          coreInfo.pages[i].renderBox!.globalToLocal(focalPoint))) return i;
    }
    return null;
  }

  /// The position of the previous draw gesture event.
  /// Used to move a selection.
  Offset previousPosition = Offset.zero;

  /// The total offset of the current move gesture.
  /// Used to record a move in the history.
  Offset moveOffset = Offset.zero;

  int? dragPageIndex;
  double? currentPressure;
  bool isDrawGesture(ScaleStartDetails details) {
    if (coreInfo.readOnly) return false;

    CanvasImage.activeListener
        .notifyListenersPlease(); // un-select active image

    _lastSeenPointerCountTimer?.cancel();
    if (lastSeenPointerCount >= 2) {
      // was a zoom gesture, ignore
      lastSeenPointerCount = lastSeenPointerCount;
      return false;
    } else if (details.pointerCount >= 2) {
      // is a zoom gesture, remove accidental stroke
      if (lastSeenPointerCount == 1 &&
          Prefs.editorFingerDrawing.value &&
          (currentTool is Pen || currentTool is Eraser)) {
        EditorHistoryItem? item = history.removeAccidentalStroke();
        if (item != null) undo(item);
      }
      lastSeenPointerCount = details.pointerCount;
      return false;
    } else {
      // is a stroke
      lastSeenPointerCount = details.pointerCount;
    }

    dragPageIndex = onWhichPageIsFocalPoint(details.focalPoint);
    if (dragPageIndex == null) return false;

    if (currentTool == Tool.textEditing) {
      return false;
    } else if (Prefs.editorFingerDrawing.value || currentPressure != null) {
      return true;
    } else {
      log.fine('Non-stylus found, rejected stroke');
      return false;
    }
  }

  void onDrawStart(ScaleStartDetails details) {
    final page = coreInfo.pages[dragPageIndex!];
    final position = page.renderBox!.globalToLocal(details.focalPoint);
    history.canRedo = false;

    if (currentTool is Pen) {
      (currentTool as Pen)
          .onDragStart(position, page, dragPageIndex!, currentPressure);
    } else if (currentTool is Eraser) {
      for (Stroke stroke in (currentTool as Eraser)
          .checkForOverlappingStrokes(position, page.strokes)) {
        page.strokes.remove(stroke);
      }
      removeExcessPages();
    } else if (currentTool is Select) {
      Select select = currentTool as Select;
      if (select.doneSelecting &&
          select.selectResult.pageIndex == dragPageIndex! &&
          select.selectResult.path.contains(position)) {
        // drag selection in onDrawUpdate
      } else {
        select.onDragStart(position, dragPageIndex!);
        history.canRedo = true; // selection doesn't affect history
      }
    } else if (currentTool is LaserPointer) {
      (currentTool as LaserPointer).onDragStart(position, page, dragPageIndex!);
    }

    previousPosition = position;
    moveOffset = Offset.zero;

    if (currentTool is! Select) {
      Select.currentSelect.unselect();
    }

    // setState to let canvas know about currentStroke
    setState(() {});
  }

  void onDrawUpdate(ScaleUpdateDetails details) {
    final page = coreInfo.pages[dragPageIndex!];
    final position = page.renderBox!.globalToLocal(details.focalPoint);
    final offset = position - previousPosition;
    if (currentTool is Pen) {
      (currentTool as Pen).onDragUpdate(position, currentPressure);
      page.redrawStrokes();
    } else if (currentTool is Eraser) {
      for (Stroke stroke in (currentTool as Eraser)
          .checkForOverlappingStrokes(position, page.strokes)) {
        page.strokes.remove(stroke);
      }
      page.redrawStrokes();
      removeExcessPages();
    } else if (currentTool is Select) {
      Select select = currentTool as Select;
      if (select.doneSelecting) {
        for (Stroke stroke in select.selectResult.strokes) {
          stroke.shift(offset);
        }
        for (EditorImage image in select.selectResult.images) {
          image.dstRect = image.dstRect.shift(offset);
        }
        select.selectResult.path = select.selectResult.path.shift(offset);
      } else {
        select.onDragUpdate(position);
      }
      page.redrawStrokes();
    } else if (currentTool is LaserPointer) {
      (currentTool as LaserPointer).onDragUpdate(position);
      page.redrawStrokes();
    }
    previousPosition = position;
    moveOffset += offset;
  }

  void onDrawEnd(ScaleEndDetails details) {
    final page = coreInfo.pages[dragPageIndex!];
    bool shouldSave = true;
    setState(() {
      if (currentTool is Pen) {
        Stroke newStroke = (currentTool as Pen).onDragEnd();
        if (newStroke.isEmpty) return;

        if (Prefs.autoStraightenLines.value &&
            currentTool is! ShapePen &&
            newStroke.isStraightLine()) {
          newStroke.convertToLine();
        }

        createPage(newStroke.pageIndex);
        page.insertStroke(newStroke);
        history.recordChange(EditorHistoryItem(
          type: EditorHistoryItemType.draw,
          pageIndex: dragPageIndex!,
          strokes: [newStroke],
          images: [],
        ));
      } else if (currentTool is Eraser) {
        final erased = (currentTool as Eraser).onDragEnd();
        if (stylusButtonPressed || Prefs.disableEraserAfterUse.value) {
          // restore previous tool
          stylusButtonPressed = false;
          currentTool = tmpTool!;
          tmpTool = null;
        }
        if (erased.isEmpty) return;
        history.recordChange(EditorHistoryItem(
          type: EditorHistoryItemType.erase,
          pageIndex: dragPageIndex!,
          strokes: erased,
          images: [],
        ));
      } else if (currentTool is Select) {
        if (moveOffset == Offset.zero) return;
        Select select = currentTool as Select;
        if (select.doneSelecting) {
          history.recordChange(EditorHistoryItem(
            type: EditorHistoryItemType.move,
            pageIndex: dragPageIndex!,
            strokes: select.selectResult.strokes,
            images: select.selectResult.images,
            offset: Rect.fromLTRB(
              moveOffset.dx,
              moveOffset.dy,
              moveOffset.dx,
              moveOffset.dy,
            ),
          ));
        } else {
          shouldSave = false;
          select.onDragEnd(page.strokes, page.images);

          if (select.selectResult.isEmpty) {
            Select.currentSelect.unselect();
          }
        }
      } else if (currentTool is LaserPointer) {
        shouldSave = false;
        Stroke newStroke = (currentTool as LaserPointer).onDragEnd(
          page.redrawStrokes,
          (Stroke stroke) {
            page.laserStrokes.remove(stroke);
          },
        );
        page.laserStrokes.add(newStroke);
      }
    });

    if (shouldSave) autosaveAfterDelay();
  }

  void onInteractionEnd(ScaleEndDetails details) {
    // reset after 1ms to keep track of the same gesture only
    _lastSeenPointerCountTimer?.cancel();
    _lastSeenPointerCountTimer = Timer(const Duration(milliseconds: 10), () {
      lastSeenPointerCount = 0;
    });
  }

  void onPressureChanged(double? pressure) {
    currentPressure = pressure == 0 ? null : pressure;
  }

  void onStylusButtonChanged(bool buttonPressed) {
    // whether the stylus button is or was pressed
    stylusButtonPressed = stylusButtonPressed || buttonPressed;

    // if needed, switch to eraser
    if (!stylusButtonPressed) return;
    if (currentTool is Eraser) return;
    if (currentTool is Pen && dragPageIndex != null) {
      // if the pen is currently drawing, end the stroke
      (currentTool as Pen).onDragEnd();
    }
    tmpTool = currentTool;
    currentTool = Eraser();
    setState(() {});
  }

  void onMoveImage(EditorImage image, Rect offset) {
    history.recordChange(EditorHistoryItem(
      type: EditorHistoryItemType.move,
      pageIndex: image.pageIndex,
      strokes: [],
      images: [image],
      offset: offset,
    ));
    // setState to update undo button
    setState(() {});
    autosaveAfterDelay();
  }

  void onDeleteImage(EditorImage image) {
    history.recordChange(EditorHistoryItem(
      type: EditorHistoryItemType.erase,
      pageIndex: image.pageIndex,
      strokes: [],
      images: [image],
    ));
    setState(() {
      coreInfo.pages[image.pageIndex].images.remove(image);
    });
    autosaveAfterDelay();
  }

  void listenToQuillChanges(QuillStruct quill, int pageIndex) {
    quill.changeSubscription?.cancel();
    quill.changeSubscription = quill.controller.changes.listen((event) {
      final undoRedoButtonsNeedUpdating = !history.canUndo || history.canRedo;
      _addQuillChangeToHistory(
        quill: quill,
        pageIndex: pageIndex,
        event: event,
      );
      createPage(pageIndex); // create empty last page
      if (undoRedoButtonsNeedUpdating) {
        setState(() {});
      }
      autosaveAfterDelay();
    });
    quill.focusNode.addListener(_onQuillFocusChange);
  }

  void _onQuillFocusChange() {
    for (EditorPage page in coreInfo.pages) {
      if (!page.quill.focusNode.hasFocus) continue;
      quillFocus.value = page.quill;
    }
  }

  void _addQuillChangeToHistory({
    required QuillStruct quill,
    required int pageIndex,
    required flutter_quill.DocChange event,
  }) {
    final eventWasUndo = quill.controller.hasRedo;
    if (eventWasUndo) return;

    // the change subscription sometimes fires multiple times for the same change
    // so compare the "before" of each change to merge them
    if (history.canUndo && !history.canRedo) {
      final lastChange = history.peekUndo();
      if (lastChange.type == EditorHistoryItemType.quillChange &&
          lastChange.pageIndex == pageIndex &&
          lastChange.quillChange!.before == event.before) {
        history.undo(); // remove the last change, to be replaced
      }
    }

    history.recordChange(EditorHistoryItem(
      type: EditorHistoryItemType.quillChange,
      pageIndex: pageIndex,
      strokes: const [],
      images: const [],
      quillChange: event,
    ));
  }

  void autosaveAfterDelay() {
    savingState.value = SavingState.waitingToSave;
    _delayedSaveTimer?.cancel();
    if (Prefs.autosaveDelay.value < 0) return;
    _delayedSaveTimer =
        Timer(Duration(milliseconds: Prefs.autosaveDelay.value), () {
      saveToFile();
    });
  }

  Future<void> saveToFile() async {
    if (coreInfo.readOnly) return;

    switch (savingState.value) {
      case SavingState.saved:
        // avoid saving if nothing has changed
        return;
      case SavingState.saving:
        // avoid saving if already saving
        log.warning('saveToFile() called while already saving');
        return;
      case SavingState.waitingToSave:
        // continue
        _delayedSaveTimer?.cancel();
        savingState.value = SavingState.saving;
    }

    final filePath = coreInfo.filePath + Editor.extension;
    final Uint8List bson;
    final OrderedAssetCache assets;
    coreInfo.assetCache.allowRemovingAssets = false;
    try {
      (bson, assets) = coreInfo.saveToBinary(
        currentPageIndex: currentPageIndex,
      );
    } finally {
      coreInfo.assetCache.allowRemovingAssets = true;
    }
    try {
      await Future.wait([
        FileManager.writeFile(filePath, bson, awaitWrite: true),
        for (int i = 0; i < assets.length; ++i)
          assets.getBytes(i).then((bytes) => FileManager.writeFile(
                '$filePath.$i',
                bytes,
                awaitWrite: true,
              )),
        FileManager.removeUnusedAssets(
          filePath,
          numAssets: assets.length,
        ),
      ]);
      savingState.value = SavingState.saved;
    } catch (e) {
      log.severe('Failed to save file: $e', e);
      savingState.value = SavingState.waitingToSave;
      if (kDebugMode) rethrow;
      return;
    }

    if (!mounted) return;
    final screenshotter = ScreenshotController();
    final page = coreInfo.pages.first;
    final previewHeight = page.previewHeight(
      lineHeight: coreInfo.lineHeight,
    );
    final thumbnailSize = Size(720, 720 * previewHeight / page.size.width);
    final thumbnail = await screenshotter.captureFromWidget(
      Theme(
        data: ThemeData(
          brightness: Brightness.light,
          colorScheme: const ColorScheme.light(
            primary: EditorExporter.primaryColor,
            secondary: EditorExporter.secondaryColor,
          ),
        ),
        child: Localizations.override(
          context: context,
          child: SizedBox(
            width: thumbnailSize.width,
            height: thumbnailSize.height,
            child: FittedBox(
              child: pagePreviewBuilder(
                context,
                pageIndex: 0,
                previewHeight: previewHeight,
              ),
            ),
          ),
        ),
      ),
      pixelRatio: 1,
      context: context,
      targetSize: thumbnailSize,
    );
    await FileManager.writeFile(
      // Note that this ends with .sbn2.p
      '$filePath.p',
      thumbnail,
      awaitWrite: true,
    );
  }

  late final _filenameFormKey = GlobalKey<FormState>();
  late final filenameTextEditingController = TextEditingController();
  Timer? _renameTimer;
  void renameFile([String? _]) {
    _renameTimer?.cancel();
    _renameTimer = Timer(const Duration(seconds: 5), _renameFileNow);
  }

  Future<void> _renameFileNow() async {
    final newName = filenameTextEditingController.text;
    if (newName == coreInfo.fileName) return;

    if (_filenameFormKey.currentState?.validate() ?? true) {
      coreInfo.filePath = await FileManager.moveFile(
          coreInfo.filePath + Editor.extension, newName + Editor.extension);
      coreInfo.filePath = coreInfo.filePath
          .substring(0, coreInfo.filePath.lastIndexOf(Editor.extension));
      needsNaming = false;
    }

    final actualName = coreInfo.fileName;
    if (actualName != newName) {
      // update text field if renamed differently
      filenameTextEditingController.value =
          filenameTextEditingController.value.copyWith(
        text: actualName,
        selection:
            TextSelection.fromPosition(TextPosition(offset: actualName.length)),
        composing: TextRange.empty,
      );
    }
  }

  String? _validateFilenameTextField(String? newName) {
    if (newName == null) return null;
    if (newName.isEmpty) return t.home.renameNote.noteNameEmpty;
    if (newName.contains('/')) return t.home.renameNote.noteNameContainsSlash;
    return null;
  }

  void updateColorBar(Color color) {
    if (Prefs.recentColorsDontSavePresets.value) {
      if (ColorBar.colorPresets
          .any((colorPreset) => colorPreset.color == color)) {
        return;
      }
    }

    final String newColorString = color.value.toString();

    // migrate from old pref format
    if (Prefs.recentColorsChronological.value.length !=
        Prefs.recentColorsPositioned.value.length) {
      log.info(
          'MIGRATING recentColors: ${Prefs.recentColorsChronological.value.length} vs ${Prefs.recentColorsPositioned.value.length}');
      Prefs.recentColorsChronological.value =
          List.of(Prefs.recentColorsPositioned.value);
    }

    if (Prefs.pinnedColors.value.contains(newColorString)) {
      // do nothing, color is already pinned
    } else if (Prefs.recentColorsPositioned.value.contains(newColorString)) {
      // if it's already a recent color, move it to the top
      Prefs.recentColorsChronological.value.remove(newColorString);
      Prefs.recentColorsChronological.value.add(newColorString);
      Prefs.recentColorsChronological.notifyListeners();
    } else {
      if (Prefs.recentColorsPositioned.value.length >=
          Prefs.recentColorsLength.value) {
        // if full, replace the oldest color with the new one
        final String removedColorString =
            Prefs.recentColorsChronological.value.removeAt(0);
        Prefs.recentColorsChronological.value.add(newColorString);
        final int removedColorPosition =
            Prefs.recentColorsPositioned.value.indexOf(removedColorString);
        Prefs.recentColorsPositioned.value[removedColorPosition] =
            newColorString;
      } else {
        // if not full, add the new color to the end
        Prefs.recentColorsChronological.value.add(newColorString);
        Prefs.recentColorsPositioned.value.insert(0, newColorString);
      }
      Prefs.recentColorsChronological.notifyListeners();
      Prefs.recentColorsPositioned.notifyListeners();
    }
  }

  /// Prompts the user to pick photos from their device.
  /// Returns the number of photos picked.
  ///
  /// If [photoInfos] is provided, it will be used instead of the file picker.
  Future<int> _pickPhotos([List<_PhotoInfo>? photoInfos]) async {
    if (coreInfo.readOnly) return 0;

    final currentPageIndex = this.currentPageIndex;

    photoInfos ??= await _pickPhotosWithFilePicker();
    if (photoInfos.isEmpty) return 0;

    // use the Select tool so that the user can move the new image
    currentTool = Select.currentSelect;

    List<EditorImage> images = [
      for (final _PhotoInfo photoInfo in photoInfos)
        if (photoInfo.extension == '.svg')
          SvgEditorImage(
            id: coreInfo.nextImageId++,
            svgString: utf8.decode(photoInfo.bytes),
            svgFile: null,
            pageIndex: currentPageIndex,
            pageSize: coreInfo.pages[currentPageIndex].size,
            onMoveImage: onMoveImage,
            onDeleteImage: onDeleteImage,
            onMiscChange: autosaveAfterDelay,
            onLoad: () => setState(() {}),
            assetCache: coreInfo.assetCache,
          )
        else
          PngEditorImage(
            id: coreInfo.nextImageId++,
            extension: photoInfo.extension,
            imageProvider: MemoryImage(photoInfo.bytes),
            pageIndex: currentPageIndex,
            pageSize: coreInfo.pages[currentPageIndex].size,
            onMoveImage: onMoveImage,
            onDeleteImage: onDeleteImage,
            onMiscChange: autosaveAfterDelay,
            onLoad: () => setState(() {}),
            assetCache: coreInfo.assetCache,
          ),
    ];

    history.recordChange(EditorHistoryItem(
      type: EditorHistoryItemType.draw,
      pageIndex: currentPageIndex,
      strokes: [],
      images: images,
    ));
    createPage(currentPageIndex);
    coreInfo.pages[currentPageIndex].images.addAll(images);
    autosaveAfterDelay();

    return images.length;
  }

  Future<List<_PhotoInfo>> _pickPhotosWithFilePicker() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      // Taken from
      // https://github.com/brendan-duncan/image/blob/main/doc/formats.md
      // (plus .svg)
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png',
        'gif',
        'tiff',
        'bmp',
        'tga',
        'ico',
        'pvrtc',
        'svg',
        'webp',
        'psd',
        'exr',
      ],
      allowMultiple: true,
      withData: true,
    );
    if (result == null) return const [];

    return [
      for (final PlatformFile file in result.files)
        if (file.bytes != null && file.extension != null)
          (
            bytes: file.bytes!,
            extension: '.${file.extension}',
          ),
    ];
  }

  /// Prompts the user to pick a PDF to import.
  /// Returns whether a PDF was picked.
  Future<bool> importPdf() async {
    if (coreInfo.readOnly) return false;
    if (!Editor.canRasterPdf) return false;

    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
      withData: false,
    );
    if (result == null) return false;

    final PlatformFile file = result.files.single;
    return importPdfFromFilePath(file.path!);
  }

  Future<bool> importPdfFromFilePath(String path) async {
    final pdfFile = File(path);
    final Uint8List pdfBytes;
    try {
      pdfBytes = await pdfFile.readAsBytes();
    } catch (e) {
      log.severe('Failed to read file when importing $path: $e', e);
      return false;
    }

    final emptyPage = coreInfo.pages.removeLast();
    assert(emptyPage.isEmpty);

    final raster = Printing.raster(
      pdfBytes,
      dpi: 1,
    );

    int currentPdfPage = -1;
    await for (final pdfPage in raster) {
      ++currentPdfPage;
      assert(currentPdfPage >= 0);

      // resize to [defaultWidth] to keep pen sizes consistent
      final pageSize = Size(
        EditorPage.defaultWidth,
        EditorPage.defaultWidth * pdfPage.height / pdfPage.width,
      );

      final page = EditorPage(
        width: pageSize.width,
        height: pageSize.height,
      );
      page.backgroundImage = PdfEditorImage(
        id: coreInfo.nextImageId++,
        pdfBytes: pdfBytes,
        pdfFile: pdfFile,
        pdfPage: currentPdfPage,
        pageIndex: coreInfo.pages.length,
        pageSize: pageSize,
        naturalSize: Size(pdfPage.width.toDouble(), pdfPage.height.toDouble()),
        onMoveImage: onMoveImage,
        onDeleteImage: onDeleteImage,
        onMiscChange: autosaveAfterDelay,
        onLoad: () => setState(() {}),
        assetCache: coreInfo.assetCache,
      );
      coreInfo.pages.add(page);
      history.recordChange(EditorHistoryItem(
        type: EditorHistoryItemType.insertPage,
        pageIndex: coreInfo.pages.length - 1,
        strokes: const [],
        images: const [],
        page: page,
      ));

      if (currentPdfPage == 0) {
        // update ui after we've rastered the first page
        // so that the user has some indication that the import is working
        setState(() {});
      }
    }

    coreInfo.pages.add(emptyPage);
    setState(() {});

    autosaveAfterDelay();

    return true;
  }

  Future paste() async {
    /// Maps image formats to their file extension.
    const Map<SimpleFileFormat, String> formats = {
      Formats.jpeg: '.jpeg',
      Formats.png: '.png',
      Formats.gif: '.gif',
      Formats.tiff: '.tiff',
      Formats.bmp: '.bmp',
      Formats.ico: '.ico',
      Formats.svg: '.svg',
      Formats.webp: '.webp',
    };

    final reader = await SystemClipboard.instance?.read();
    if (reader == null) return;

    final List<_PhotoInfo> photoInfos = [];
    final List<ReadProgress> progresses = [];

    for (SimpleFileFormat format in formats.keys) {
      if (!reader.canProvide(format)) continue;
      final progress = reader.getFile(
        format,
        (file) async {
          final stream = file.getStream();
          final List<int> bytes = [];
          await for (final chunk in stream) {
            bytes.addAll(chunk);
          }
          if (bytes.isEmpty) {
            log.warning('Pasted empty file: $file (${formats[format]})');
            return;
          }

          String extension;
          if (file.fileName != null) {
            extension =
                file.fileName!.substring(file.fileName!.lastIndexOf('.'));
          } else {
            extension = formats[format]!;
          }

          photoInfos.add((
            bytes: Uint8List.fromList(bytes),
            extension: extension,
          ));
        },
      );
      if (progress != null) progresses.add(progress);
    }

    while (progresses.isNotEmpty) {
      progresses.removeWhere((progress) => progress.fraction.value == 1);
      await Future.delayed(const Duration(milliseconds: 50));
    }

    await _pickPhotos(photoInfos);
  }

  Future exportAsPdf(BuildContext context) async {
    final pdf = await EditorExporter.generatePdf(coreInfo, context);
    final bytes = await pdf.save();
    if (!context.mounted) return;
    await FileManager.exportFile('${coreInfo.fileName}.pdf', bytes,
        context: context);
  }

  /// Exports the current note as an SBA (Saber Archive) file.
  Future exportAsSba(BuildContext context) async {
    final sba = await coreInfo.saveToSba(
      currentPageIndex: currentPageIndex,
    );
    if (!context.mounted) return;
    await FileManager.exportFile(
      '${coreInfo.fileName}.sba',
      sba,
      context: context,
    );
  }

  void setAndroidNavBarColor() async {
    if (coreInfo.filePath.isEmpty) return; // not loaded yet

    final theme = Theme.of(context);

    // whiteboard on mobile should keep home screen navbar color
    if (coreInfo.filePath == Whiteboard.filePath &&
        !ResponsiveNavbar.isLargeScreen) {
      return ResponsiveNavbar.setAndroidNavBarColor(theme);
    }

    await null;
    if (!mounted) return;

    final brightness = theme.brightness;
    final otherBrightness =
        brightness == Brightness.dark ? Brightness.light : Brightness.dark;
    final overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;

    SystemChrome.setSystemUIOverlayStyle(overlayStyle.copyWith(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: otherBrightness,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final platform = Theme.of(context).platform;
    final cupertino =
        platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;
    final isToolbarVertical =
        Prefs.editorToolbarAlignment.value == AxisDirection.left ||
            Prefs.editorToolbarAlignment.value == AxisDirection.right;

    setAndroidNavBarColor();

    final Widget canvas = CanvasGestureDetector(
      key: _canvasGestureDetectorKey,
      filePath: coreInfo.filePath,
      isDrawGesture: isDrawGesture,
      onInteractionEnd: onInteractionEnd,
      onDrawStart: onDrawStart,
      onDrawUpdate: onDrawUpdate,
      onDrawEnd: onDrawEnd,
      onStylusButtonChanged: onStylusButtonChanged,
      onPressureChanged: onPressureChanged,
      undo: undo,
      redo: redo,
      pages: coreInfo.pages,
      initialPageIndex: coreInfo.initialPageIndex,
      pageBuilder: pageBuilder,
      placeholderPageBuilder: (BuildContext context, int pageIndex) {
        return Canvas(
          path: coreInfo.filePath,
          page: coreInfo.pages[pageIndex],
          pageIndex: 0,
          textEditing: false,
          coreInfo: EditorCoreInfo.empty,
          currentStroke: null,
          currentStrokeDetectedShape: null,
          currentSelection: null,
          placeholder: true,
          setAsBackground: null,
          currentToolIsSelect: currentTool is Select,
        );
      },
      transformationController: _transformationController,
    );

    final Widget? readonlyBanner = coreInfo.readOnlyBecauseOfVersion
        ? Collapsible(
            collapsed:
                !(coreInfo.readOnly && coreInfo.readOnlyBecauseOfVersion),
            axis: CollapsibleAxis.vertical,
            child: SafeArea(
              child: ListTile(
                onTap: askUserToDisableReadOnly,
                title: Text(t.editor.newerFileFormat.readOnlyMode),
                subtitle: Text(t.editor.newerFileFormat.title),
                trailing: const Icon(Icons.edit_off),
              ),
            ),
          )
        : null;

    final Widget toolbar = Collapsible(
      axis: isToolbarVertical
          ? CollapsibleAxis.horizontal
          : CollapsibleAxis.vertical,
      collapsed: DynamicMaterialApp.isFullscreen &&
          !Prefs.editorToolbarShowInFullscreen.value,
      maintainState: true,
      child: SafeArea(
        bottom: Prefs.editorToolbarAlignment.value != AxisDirection.up,
        child: Toolbar(
          readOnly: coreInfo.readOnly,
          setTool: (tool) {
            setState(() {
              if (tool is Eraser) {
                // setTool(Eraser) is called to toggle eraser
                if (currentTool is Eraser && tmpTool != null) {
                  // switch to previous tool
                  tool = tmpTool!;
                  tmpTool = null;
                } else {
                  // store previous tool to restore it later
                  tmpTool = currentTool;
                }
              }

              currentTool = tool;

              if (currentTool is Highlighter) {
                Highlighter.currentHighlighter = currentTool as Highlighter;
              } else if (currentTool is Pencil) {
                Pencil.currentPencil = currentTool as Pencil;
              } else if (currentTool is Pen) {
                Pen.currentPen = currentTool as Pen;
              }
            });
          },
          currentTool: currentTool,
          duplicateSelection: () {
            final select = currentTool as Select;
            if (!select.doneSelecting) return;

            setState(() {
              final page = coreInfo.pages[select.selectResult.pageIndex];
              final strokes = select.selectResult.strokes;
              final images = select.selectResult.images;

              const duplicationFeedbackOffset = Offset(25, -25);

              final duplicatedStrokes = strokes.map((stroke) {
                return stroke.copy()..shift(duplicationFeedbackOffset);
              }).toList();

              final duplicatedImages = images.map((image) {
                return image.copy()
                  ..id = coreInfo.nextImageId++
                  ..dstRect.shift(duplicationFeedbackOffset);
              }).toList();

              page.strokes.addAll(duplicatedStrokes);
              page.images.addAll(duplicatedImages);

              select.selectResult = select.selectResult.copyWith(
                strokes: duplicatedStrokes,
                images: duplicatedImages,
                path: select.selectResult.path.shift(duplicationFeedbackOffset),
              );

              history.recordChange(EditorHistoryItem(
                type: EditorHistoryItemType.draw,
                pageIndex: select.selectResult.pageIndex,
                strokes: duplicatedStrokes,
                images: duplicatedImages,
              ));
              autosaveAfterDelay();
            });
          },
          deleteSelection: () {
            final select = currentTool as Select;
            if (!select.doneSelecting) {
              return;
            }

            setState(() {
              final page = coreInfo.pages[select.selectResult.pageIndex];
              final strokes = select.selectResult.strokes;
              final images = select.selectResult.images;

              for (Stroke stroke in strokes) {
                page.strokes.remove(stroke);
              }
              for (EditorImage image in images) {
                page.images.remove(image);
              }

              select.unselect();

              history.recordChange(EditorHistoryItem(
                type: EditorHistoryItemType.erase,
                pageIndex: strokes.first.pageIndex,
                strokes: strokes,
                images: images,
              ));
              autosaveAfterDelay();
            });
          },
          setColor: (color) {
            setState(() {
              updateColorBar(color);

              if (currentTool is Highlighter) {
                (currentTool as Highlighter).color =
                    color.withAlpha(Highlighter.alpha);
              } else if (currentTool is Pen) {
                (currentTool as Pen).color = color;
              } else if (currentTool is Select) {
                // Changes color of selected strokes
                final select = currentTool as Select;
                if (select.doneSelecting) {
                  final strokes = select.selectResult.strokes;

                  Map<Stroke, ColorChange> colorChange = {};
                  for (Stroke stroke in strokes) {
                    colorChange[stroke] =
                        ColorChange(previous: stroke.color, current: color);
                    stroke.color = color;
                  }

                  history.recordChange(EditorHistoryItem(
                    type: EditorHistoryItemType.changeColor,
                    pageIndex: strokes.first.pageIndex,
                    strokes: strokes,
                    colorChange: colorChange,
                    images: [],
                  ));
                  autosaveAfterDelay();
                }
              }
            });
          },
          quillFocus: quillFocus,
          textEditing: currentTool == Tool.textEditing,
          toggleTextEditing: () => setState(() {
            if (currentTool == Tool.textEditing) {
              currentTool = Pen.currentPen;
              for (EditorPage page in coreInfo.pages) {
                // unselect text, but maintain cursor position
                page.quill.controller.moveCursorToPosition(
                    page.quill.controller.selection.extentOffset);
                page.quill.focusNode.unfocus();
              }
            } else {
              currentTool = Tool.textEditing;
              quillFocus.value = coreInfo.pages[currentPageIndex].quill
                ..focusNode.requestFocus();
            }
          }),
          undo: undo,
          isUndoPossible: history.canUndo,
          redo: redo,
          isRedoPossible: history.canRedo,
          toggleFingerDrawing: () {
            setState(() {
              Prefs.editorFingerDrawing.value =
                  !Prefs.editorFingerDrawing.value;
              lastSeenPointerCount = 0;
            });
          },
          pickPhoto: _pickPhotos,
          paste: paste,
          exportAsSba: exportAsSba,
          exportAsPdf: exportAsPdf,
          exportAsPng: null,
        ),
      ),
    );

    Widget body = LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        final double screenHeight = constraints.maxHeight;

        if (isToolbarVertical) {
          return Row(
            textDirection: Prefs.editorToolbarAlignment.value == AxisDirection.left
                ? TextDirection.ltr
                : TextDirection.rtl,
            children: [
              toolbar,
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: canvas,
                    ),
                    if (readonlyBanner != null) readonlyBanner,
                  ],
                ),
              ),
            ],
          );
        } else {
          return Column(
            verticalDirection: Prefs.editorToolbarAlignment.value == AxisDirection.up
                ? VerticalDirection.up
                : VerticalDirection.down,
            children: [
              Stack(
                children: [
                  // 原始界面
                  SizedBox(
                    width: screenWidth,
                    height: screenHeight - kToolbarHeight, // 考慮工具欄的高度
                    child: canvas,
                  ),
                  toolbar,
                  Container(
                    // 添加原始界面的小部件
                  ),
                  // 搜索按鈕
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSearchOpen = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.blue, // 調整顏色
                        child: const Icon(Icons.search, color: Colors.white), // 添加搜索圖標
                      ),
                    ),
                  ),
                  // 如果搜索界面打开，则显示搜索界面
                  if (_isSearchOpen)
                    searchInterfaceDialog(context),
                ],
              ),
              if (readonlyBanner != null) readonlyBanner,
            ],
          );
        }
      },
    );

    return ValueListenableBuilder(
      valueListenable: savingState,
      builder: (context, savingState, child) {
        // don't allow user to go back until saving is done
        return PopScope(
          canPop: savingState == SavingState.saved,
          onPopInvoked: (didPop) {
            switch (savingState) {
              case SavingState.waitingToSave:
                assert(!didPop);
                saveToFile(); // trigger save now
                snackBarNeedsToSaveBeforeExiting();
              case SavingState.saving:
                assert(!didPop);
                snackBarNeedsToSaveBeforeExiting();
              case SavingState.saved:
                break;
            }
          },
          child: child!,
        );
      },
      child: Scaffold(
        appBar: DynamicMaterialApp.isFullscreen
            ? null
            : AppBar(
                toolbarHeight: kToolbarHeight,
                title: widget.customTitle != null
                    ? Text(widget.customTitle!)
                    : Form(
                        key: _filenameFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: filenameTextEditingController,
                          onChanged: renameFile,
                          autofocus: needsNaming,
                          validator: _validateFilenameTextField,
                        ),
                      ),
                leading: SaveIndicator(
                  savingState: savingState,
                  triggerSave: saveToFile,
                ),
                actions: [
                  IconButton(
                    icon: const AdaptiveIcon(
                      icon: Icons.insert_page_break,
                      cupertinoIcon: CupertinoIcons.add,
                    ),
                    tooltip: t.editor.menu.insertPage,
                    onPressed: () => setState(() {
                      final currentPageIndex = this.currentPageIndex;
                      insertPageAfter(currentPageIndex);
                      CanvasGestureDetector.scrollToPage(
                        pageIndex: currentPageIndex + 1,
                        pages: coreInfo.pages,
                        screenWidth: MediaQuery.sizeOf(context).width,
                        transformationController: _transformationController,
                      );
                    }),
                  ),
                  IconButton(
                    icon: const AdaptiveIcon(
                      icon: Icons.grid_view,
                      cupertinoIcon: CupertinoIcons.rectangle_grid_2x2,
                    ),
                    tooltip: t.editor.pages,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AdaptiveAlertDialog(
                          title: Text(t.editor.pages),
                          content: pageManager(context),
                          actions: const [],
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const AdaptiveIcon(
                      icon: Icons.more_vert,
                      cupertinoIcon: CupertinoIcons.ellipsis_vertical,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => bottomSheet(context),
                        isScrollControlled: true,
                        showDragHandle: true,
                        backgroundColor: colorScheme.surface,
                        constraints: const BoxConstraints(
                          maxWidth: 500,
                        ),
                      );
                    },
                  )
                ],
              ),
        body: body,
        floatingActionButton: (DynamicMaterialApp.isFullscreen &&
                !Prefs.editorToolbarShowInFullscreen.value)
            ? FloatingActionButton(
                shape: cupertino ? const CircleBorder() : null,
                onPressed: () {
                  DynamicMaterialApp.setFullscreen(false, updateSystem: true);
                },
                child: const Icon(Icons.fullscreen_exit),
              )
            : null,
      ),
    );
  }

  AlertDialog searchInterfaceDialog(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.7),
      contentPadding: EdgeInsets.zero,
      content: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: const Text('Search Interface'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _isSearchOpen = false; // 将 _isSearchOpen 设置为 false
                    });
                  },
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.7,
              padding: const EdgeInsets.all(16),
              child:ChatScreen(),
            ),
          ],
        ),
      ),
    );
  }

  void snackBarNeedsToSaveBeforeExiting() {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(t.editor.needsToSaveBeforeExiting),
    ));
  }

  Widget bottomSheet(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final bool invert =
        Prefs.editorAutoInvert.value && brightness == Brightness.dark;
    final int currentPageIndex = this.currentPageIndex;

    return EditorBottomSheet(
      invert: invert,
      coreInfo: coreInfo,
      currentPageIndex: currentPageIndex,
      setBackgroundPattern: (pattern) => setState(() {
        if (coreInfo.readOnly) return;
        coreInfo.backgroundPattern = pattern;
        Prefs.lastBackgroundPattern.value = pattern;
        autosaveAfterDelay();
      }),
      setLineHeight: (lineHeight) => setState(() {
        if (coreInfo.readOnly) return;
        coreInfo.lineHeight = lineHeight;
        Prefs.lastLineHeight.value = lineHeight;
        autosaveAfterDelay();
      }),
      removeBackgroundImage: () => setState(() {
        if (coreInfo.readOnly) return;

        final page = coreInfo.pages[currentPageIndex];
        if (page.backgroundImage == null) return;
        page.images.add(page.backgroundImage!);
        page.backgroundImage = null;

        autosaveAfterDelay();
      }),
      redrawImage: () => setState(() {}),
      clearPage: () {
        clearPage(currentPageIndex);
      },
      clearAllPages: clearAllPages,
      redrawAndSave: () => setState(() {
        if (coreInfo.readOnly) return;
        autosaveAfterDelay();
      }),
      pickPhotos: _pickPhotos,
      importPdf: importPdf,
      canRasterPdf: Editor.canRasterPdf,
    );
  }

  Widget pageBuilder(BuildContext context, int pageIndex) {
    final page = coreInfo.pages[pageIndex];
    final currentStroke =
        Pen.currentStroke?.pageIndex == pageIndex ? Pen.currentStroke : null;
    return Canvas(
      path: coreInfo.filePath,
      page: page,
      pageIndex: pageIndex,
      textEditing: currentTool == Tool.textEditing,
      coreInfo: coreInfo,
      currentStroke: currentStroke,
      currentStrokeDetectedShape:
          currentTool is ShapePen && currentStroke != null
              ? ShapePen.detectedShape
              : null,
      currentSelection: () {
        if (currentTool is! Select) return null;
        final selectResult = (currentTool as Select).selectResult;
        if (selectResult.pageIndex != pageIndex) return null;
        return selectResult;
      }(),
      setAsBackground: (EditorImage image) {
        if (page.backgroundImage != null) {
          // restore previous background image as normal image
          page.images.add(page.backgroundImage!);
        }
        page.images.remove(image);
        page.backgroundImage = image;

        CanvasImage.activeListener
            .notifyListenersPlease(); // un-select active image

        autosaveAfterDelay();
        setState(() {});
      },
      currentToolIsSelect: currentTool is Select,
    );
  }

  Widget pagePreviewBuilder(
    BuildContext context, {
    required int pageIndex,
    double? previewHeight,
  }) {
    final page = coreInfo.pages[pageIndex];
    previewHeight ??= page.previewHeight(
      lineHeight: coreInfo.lineHeight,
    );
    return CanvasPreview(
      pageIndex: pageIndex,
      height: previewHeight,
      coreInfo: coreInfo,
    );
  }

  Widget pageManager(BuildContext context) {
    return EditorPageManager(
      coreInfo: coreInfo,
      currentPageIndex: currentPageIndex,
      redrawAndSave: () => setState(() {
        if (coreInfo.readOnly) return;
        autosaveAfterDelay();
      }),
      insertPageAfter: insertPageAfter,
      duplicatePage: (int pageIndex) => setState(() {
        if (coreInfo.readOnly) return;
        final page = coreInfo.pages[pageIndex];
        final newPage = page.copyWith(
          strokes: page.strokes
              .map((stroke) => stroke.copy()..pageIndex += 1)
              .toList(),
          images:
              page.images.map((image) => image.copy()..pageIndex += 1).toList(),
          quill: QuillStruct(
            controller: flutter_quill.QuillController(
              document: flutter_quill.Document.fromDelta(
                  page.quill.controller.document.toDelta()),
              selection: const TextSelection.collapsed(offset: 0),
            ),
            focusNode: FocusNode(debugLabel: 'Quill Focus Node'),
          ),
          backgroundImage: page.backgroundImage?.copy()?..pageIndex += 1,
        );
        coreInfo.pages.insert(pageIndex + 1, newPage);
        listenToQuillChanges(newPage.quill, pageIndex + 1);
        history.recordChange(EditorHistoryItem(
          type: EditorHistoryItemType.insertPage,
          pageIndex: pageIndex,
          strokes: const [],
          images: const [],
          page: newPage,
        ));
        autosaveAfterDelay();
      }),
      clearPage: clearPage,
      deletePage: (int pageIndex) => setState(() {
        if (coreInfo.readOnly) return;
        final page = coreInfo.pages.removeAt(pageIndex);
        createPage(pageIndex - 1);
        history.recordChange(EditorHistoryItem(
          type: EditorHistoryItemType.deletePage,
          pageIndex: pageIndex,
          strokes: const [],
          images: const [],
          page: page,
        ));
        autosaveAfterDelay();
      }),
      transformationController: _transformationController,
    );
  }

  void insertPageAfter(int pageIndex) => setState(() {
        if (coreInfo.readOnly) return;
        final page = EditorPage();
        coreInfo.pages.insert(pageIndex + 1, page);
        listenToQuillChanges(page.quill, pageIndex + 1);
        history.recordChange(EditorHistoryItem(
          type: EditorHistoryItemType.insertPage,
          pageIndex: pageIndex + 1,
          strokes: const [],
          images: const [],
          page: page,
        ));
        autosaveAfterDelay();
      });

  void clearPage(int pageIndex) {
    if (coreInfo.readOnly) return;
    final page = coreInfo.pages[pageIndex];
    setState(() {
      List<Stroke> removedStrokes = page.strokes.toList();
      List<EditorImage> removedImages = page.images.toList();
      page.strokes.clear();
      page.images.clear();
      removeExcessPages();
      history.recordChange(EditorHistoryItem(
        type: EditorHistoryItemType.erase,
        pageIndex: pageIndex,
        strokes: removedStrokes,
        images: removedImages,
      ));
      autosaveAfterDelay();
    });
  }

  void clearAllPages() {
    if (coreInfo.readOnly) return;
    setState(() {
      List<Stroke> removedStrokes = [];
      List<EditorImage> removedImages = [];
      for (final page in coreInfo.pages) {
        removedStrokes.addAll(page.strokes);
        removedImages.addAll(page.images);
        page.strokes.clear();
        page.images.clear();
      }
      removeExcessPages();
      history.recordChange(EditorHistoryItem(
        type: EditorHistoryItemType.erase,
        pageIndex: 0,
        strokes: removedStrokes,
        images: removedImages,
      ));
    });
    autosaveAfterDelay();
  }

  Future askUserToDisableReadOnly() async {
    bool disableReadOnly = await showDialog(
          context: context,
          builder: (context) => AdaptiveAlertDialog(
            title: Text(t.editor.newerFileFormat.title),
            content: Text(t.editor.newerFileFormat.subtitle),
            actions: [
              CupertinoDialogAction(
                child: Text(t.editor.newerFileFormat.cancel),
                onPressed: () => Navigator.pop(context, false),
              ),
              CupertinoDialogAction(
                child: Text(t.editor.newerFileFormat.allowEditing),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ),
        ) ??
        false;

    if (!mounted) return;
    if (!disableReadOnly) return;

    setState(() {
      coreInfo.readOnly = false;
    });
  }

  late int _lastCurrentPageIndex = coreInfo.initialPageIndex ?? 0;

  /// The index of the page that is currently centered on screen.
  int get currentPageIndex {
    if (!mounted) return _lastCurrentPageIndex;

    final screenWidth = MediaQuery.sizeOf(context).width;

    return _lastCurrentPageIndex = getPageIndexFromScrollPosition(
      scrollY: -scrollY,
      screenWidth: screenWidth,
      pages: coreInfo.pages,
    );
  }

  @visibleForTesting
  static int getPageIndexFromScrollPosition({
    required double scrollY,
    required double screenWidth,
    required List<EditorPage> pages,
  }) {
    for (int pageIndex = 0; pageIndex < pages.length; pageIndex++) {
      final bottomOfPage = CanvasGestureDetector.getTopOfPage(
        pageIndex: pageIndex + 1, // top of next page
        pages: pages,
        screenWidth: screenWidth,
      );

      if (scrollY < bottomOfPage) {
        return pageIndex;
      }
    }
    // below the last page
    return pages.length - 1;
  }

  @override
  void dispose() {
    (() async {
      if (_renameTimer?.isActive ?? false) {
        _renameTimer!.cancel();
        await _renameFileNow();
        filenameTextEditingController.dispose();
      }
      await saveToFile();
    })();

    DynamicMaterialApp.removeFullscreenListener(_setState);

    _delayedSaveTimer?.cancel();
    _lastSeenPointerCountTimer?.cancel();

    _removeKeybindings();

    coreInfo.dispose();

    // manually save pen properties since the listeners don't fire if a property is changed
    Prefs.lastFountainPenOptions.notifyListeners();
    Prefs.lastBallpointPenOptions.notifyListeners();
    Prefs.lastHighlighterOptions.notifyListeners();
    Prefs.lastPencilOptions.notifyListeners();
    Prefs.lastShapePenOptions.notifyListeners();

    super.dispose();
  }
}
