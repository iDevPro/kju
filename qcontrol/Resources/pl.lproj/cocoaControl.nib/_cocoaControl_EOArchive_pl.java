// _cocoaControl_EOArchive_pl.java
// Generated by EnterpriseObjects palette at sobota, 28 pa\u017adziernika 2006 20:28:20 Europe/Warsaw

import com.webobjects.eoapplication.*;
import com.webobjects.eocontrol.*;
import com.webobjects.eointerface.*;
import com.webobjects.eointerface.swing.*;
import com.webobjects.eointerface.swing.EOTable._EOTableColumn;
import com.webobjects.foundation.*;
import java.awt.*;
import javax.swing.*;
import javax.swing.border.*;
import javax.swing.table.*;
import javax.swing.text.*;

public class _cocoaControl_EOArchive_pl extends com.webobjects.eoapplication.EOArchive {
    cocoaControlController _cocoaControlController0;
    com.webobjects.eointerface.swing.EOFrame _eoFrame0, _eoFrame1;
    com.webobjects.eointerface.swing.EOTable _nsTableView0;
    com.webobjects.eointerface.swing.EOTable._EOTableColumn _eoTableColumn0, _eoTableColumn1;
    com.webobjects.eointerface.swing.EOTextField _nsTextField0, _nsTextField1, _nsTextField2;
    com.webobjects.eointerface.swing.EOView _nsProgressIndicator0;
    javax.swing.JButton _nsButton0;
    javax.swing.JPanel _nsView0, _nsView1;

    public _cocoaControl_EOArchive_pl(Object owner, NSDisposableRegistry registry) {
        super(owner, registry);
    }

    protected void _construct() {
        Object owner = _owner();
        EOArchive._ObjectInstantiationDelegate delegate = (owner instanceof EOArchive._ObjectInstantiationDelegate) ? (EOArchive._ObjectInstantiationDelegate)owner : null;
        Object replacement;

        super._construct();

        _nsTextField2 = (com.webobjects.eointerface.swing.EOTextField)_registered(new com.webobjects.eointerface.swing.EOTextField(), "NSTextField111");
        _nsTextField1 = (com.webobjects.eointerface.swing.EOTextField)_registered(new com.webobjects.eointerface.swing.EOTextField(), "NSTextField11");
        _nsButton0 = (javax.swing.JButton)_registered(new javax.swing.JButton("Zatrzymaj"), "NSButton");
        _nsProgressIndicator0 = (com.webobjects.eointerface.swing.EOView)_registered(new com.webobjects.eointerface.swing.EOView(), "1");
        _eoFrame1 = (com.webobjects.eointerface.swing.EOFrame)_registered(new com.webobjects.eointerface.swing.EOFrame(), "progressPanel");
        _nsView1 = (JPanel)_eoFrame1.getContentPane();
        _nsTextField0 = (com.webobjects.eointerface.swing.EOTextField)_registered(new com.webobjects.eointerface.swing.EOTextField(), "NSTextField1");
        _cocoaControlController0 = (cocoaControlController)_registered(new cocoaControlController(), "cocoaControlController");
        _eoTableColumn1 = (com.webobjects.eointerface.swing.EOTable._EOTableColumn)_registered(new com.webobjects.eointerface.swing.EOTable._EOTableColumn(), "NSTableColumn1");
        _eoTableColumn0 = (com.webobjects.eointerface.swing.EOTable._EOTableColumn)_registered(new com.webobjects.eointerface.swing.EOTable._EOTableColumn(), "NSTableColumn");
        _nsTableView0 = (com.webobjects.eointerface.swing.EOTable)_registered(new com.webobjects.eointerface.swing.EOTable(), "NSTableView");
        _eoFrame0 = (com.webobjects.eointerface.swing.EOFrame)_registered(new com.webobjects.eointerface.swing.EOFrame(), "mainWindow");
        _nsView0 = (JPanel)_eoFrame0.getContentPane();
    }

    protected void _awaken() {
        super._awaken();
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(_owner(), "orderFrontStandardAboutPanel", ), ""));
    }

    protected void _init() {
        super._init();
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(null, "arrangeInFront", ), ""));
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(null, "hide", ), ""));
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(null, "terminate", ), ""));
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(null, "performMiniaturize", ), ""));
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(null, "performZoom", ), ""));
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(null, "showHelp", ), ""));
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(null, "unhideAllApplications", ), ""));
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(null, "hideOtherApplications", ), ""));
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(_cocoaControlController0, "openFreeOSDownloader", ), ""));
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(_cocoaControlController0, "importVPC7PC", ), ""));
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(_cocoaControlController0, "importQemuXPCs", ), ""));
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(_cocoaControlController0, "showPreferences", ), ""));
        _connect(_nsTableView0, _cocoaControlController0, "delegate");
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(_cocoaControlController0, "openDIWindow", ), ""));
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(_cocoaControlController0, "deletePC", ), ""));
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(_cocoaControlController0, "editPC", ), ""));
        .addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(_cocoaControlController0, "addPC", ), ""));
        _connect(_cocoaControlController0, _nsTextField2, "progressStatusText");
        _setFontForComponent(_nsTextField2, "Lucida Grande", 11, Font.PLAIN);
        _nsTextField2.setEditable(false);
        _nsTextField2.setOpaque(false);
        _nsTextField2.setText("Utworzone: 100 MB z 1'000 MB");
        _nsTextField2.setHorizontalAlignment(javax.swing.JTextField.LEFT);
        _nsTextField2.setSelectable(false);
        _nsTextField2.setEnabled(true);
        _nsTextField2.setBorder(null);
        _connect(_cocoaControlController0, _nsTextField1, "progressText");
        _setFontForComponent(_nsTextField1, "Lucida Grande", 11, Font.PLAIN);
        _nsTextField1.setEditable(false);
        _nsTextField1.setOpaque(false);
        _nsTextField1.setText("Obraz dysku: myimage.img");
        _nsTextField1.setHorizontalAlignment(javax.swing.JTextField.LEFT);
        _nsTextField1.setSelectable(false);
        _nsTextField1.setEnabled(true);
        _nsTextField1.setBorder(null);
        _setFontForComponent(_nsButton0, "Lucida Grande", 11, Font.PLAIN);
        _nsButton0.setMargin(new Insets(0, 2, 0, 2));
        _connect(_cocoaControlController0, _nsProgressIndicator0, "progressIndicator");
        if (!(_nsView1.getLayout() instanceof EOViewLayout)) { _nsView1.setLayout(new EOViewLayout()); }
        _nsProgressIndicator0.setSize(275, 12);
        _nsProgressIndicator0.setLocation(12, 36);
        ((EOViewLayout)_nsView1.getLayout()).setAutosizingMask(_nsProgressIndicator0, EOViewLayout.MinYMargin);
        _nsView1.add(_nsProgressIndicator0);
        _nsButton0.setSize(73, 22);
        _nsButton0.setLocation(303, 30);
        ((EOViewLayout)_nsView1.getLayout()).setAutosizingMask(_nsButton0, EOViewLayout.MinYMargin);
        _nsView1.add(_nsButton0);
        _nsTextField0.setSize(149, 14);
        _nsTextField0.setLocation(11, 14);
        ((EOViewLayout)_nsView1.getLayout()).setAutosizingMask(_nsTextField0, EOViewLayout.MinYMargin);
        _nsView1.add(_nsTextField0);
        _nsTextField1.setSize(275, 14);
        _nsTextField1.setLocation(11, 54);
        ((EOViewLayout)_nsView1.getLayout()).setAutosizingMask(_nsTextField1, EOViewLayout.MinYMargin);
        _nsView1.add(_nsTextField1);
        _nsTextField2.setSize(275, 14);
        _nsTextField2.setLocation(11, 76);
        ((EOViewLayout)_nsView1.getLayout()).setAutosizingMask(_nsTextField2, EOViewLayout.MinYMargin);
        _nsView1.add(_nsTextField2);
        _nsView1.setSize(386, 104);
        _eoFrame1.setTitle("Post\u0119p");
        _eoFrame1.setLocation(306, 487);
        _eoFrame1.setSize(386, 104);
        _connect(_cocoaControlController0, _eoFrame1, "progressPanel");
        _setFontForComponent(_nsTextField0, "Lucida Grande", 11, Font.PLAIN + Font.BOLD);
        _nsTextField0.setEditable(false);
        _nsTextField0.setOpaque(false);
        _nsTextField0.setText("Tworzenie obrazu dysku");
        _nsTextField0.setHorizontalAlignment(javax.swing.JTextField.LEFT);
        _nsTextField0.setSelectable(false);
        _nsTextField0.setEnabled(true);
        _nsTextField0.setBorder(null);
        _connect(_cocoaControlController0, _nsTextField0, "progressTitle");
        _connect(_cocoaControlController0, , "windowMenu");
        _connect(_cocoaControlController0, _eoFrame0, "mainWindow");
        _connect(_cocoaControlController0, _nsTableView0, "table");
        _connect(_nsTableView0, _cocoaControlController0, "dataSource");
        _eoTableColumn1.setMinWidth(69);
        _eoTableColumn1.setMaxWidth(1000);
        _eoTableColumn1.setPreferredWidth(142);
        _eoTableColumn1.setWidth(142);
        _eoTableColumn1.setResizable(true);
        _eoTableColumn1.setHeaderValue("Description");
        if ((_eoTableColumn1.getHeaderRenderer() != null)) {
        	((DefaultTableCellRenderer)(_eoTableColumn1.getHeaderRenderer())).setHorizontalAlignment(javax.swing.JTextField.LEFT);
        }
        _eoTableColumn0.setMinWidth(100);
        _eoTableColumn0.setMaxWidth(100);
        _eoTableColumn0.setPreferredWidth(100);
        _eoTableColumn0.setWidth(100);
        _eoTableColumn0.setResizable(false);
        _eoTableColumn0.setHeaderValue("Image");
        if ((_eoTableColumn0.getHeaderRenderer() != null)) {
        	((DefaultTableCellRenderer)(_eoTableColumn0.getHeaderRenderer())).setHorizontalAlignment(javax.swing.JTextField.LEFT);
        }
        _nsTableView0.table().addColumn(_eoTableColumn0);
        _nsTableView0.table().addColumn(_eoTableColumn1);
        _setFontForComponent(_nsTableView0.table().getTableHeader(), "Lucida Grande", 11, Font.PLAIN);
        _nsTableView0.table().setRowHeight(78);
        if (!(_nsView0.getLayout() instanceof EOViewLayout)) { _nsView0.setLayout(new EOViewLayout()); }
        _nsTableView0.setSize(250, 400);
        _nsTableView0.setLocation(-7, -6);
        ((EOViewLayout)_nsView0.getLayout()).setAutosizingMask(_nsTableView0, EOViewLayout.WidthSizable | EOViewLayout.HeightSizable);
        _nsView0.add(_nsTableView0);
        _nsView0.setSize(236, 388);
        _eoFrame0.setTitle("Kontrola Q");
        _eoFrame0.setLocation(250, 307);
        _eoFrame0.setSize(236, 388);
    }
}