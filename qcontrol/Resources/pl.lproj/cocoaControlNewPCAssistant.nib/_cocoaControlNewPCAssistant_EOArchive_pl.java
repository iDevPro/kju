// _cocoaControlNewPCAssistant_EOArchive_pl.java
// Generated by EnterpriseObjects palette at sobota, 28 pa\u017adziernika 2006 19:47:05 Europe/Warsaw

import com.webobjects.eoapplication.*;
import com.webobjects.eocontrol.*;
import com.webobjects.eointerface.*;
import com.webobjects.eointerface.swing.*;
import com.webobjects.foundation.*;
import java.awt.*;
import javax.swing.*;
import javax.swing.border.*;
import javax.swing.table.*;
import javax.swing.text.*;

public class _cocoaControlNewPCAssistant_EOArchive_pl extends com.webobjects.eoapplication.EOArchive {
    com.webobjects.eointerface.swing.EOFrame _eoFrame0;
    com.webobjects.eointerface.swing.EOImageView _nsImageView0;
    com.webobjects.eointerface.swing.EOTextField _nsTextField0, _nsTextField1, _nsTextField2, _nsTextField3, _nsTextField4;
    com.webobjects.eointerface.swing.EOView _nsBox0, _nsBox1;
    javax.swing.JButton _nsButton0, _nsButton1;
    javax.swing.JComboBox _popup0;
    javax.swing.JPanel _nsView0;

    public _cocoaControlNewPCAssistant_EOArchive_pl(Object owner, NSDisposableRegistry registry) {
        super(owner, registry);
    }

    protected void _construct() {
        Object owner = _owner();
        EOArchive._ObjectInstantiationDelegate delegate = (owner instanceof EOArchive._ObjectInstantiationDelegate) ? (EOArchive._ObjectInstantiationDelegate)owner : null;
        Object replacement;

        super._construct();

        _nsBox1 = (com.webobjects.eointerface.swing.EOView)_registered(new com.webobjects.eointerface.swing.EOView(), "NSView");
        _nsBox0 = (com.webobjects.eointerface.swing.EOView)_registered(new com.webobjects.eointerface.swing.EOView(), "NSBox1");
        _nsTextField4 = (com.webobjects.eointerface.swing.EOTextField)_registered(new com.webobjects.eointerface.swing.EOTextField(), "NSTextField12");
        _nsTextField3 = (com.webobjects.eointerface.swing.EOTextField)_registered(new com.webobjects.eointerface.swing.EOTextField(), "NSTextField1");
        _nsTextField2 = (com.webobjects.eointerface.swing.EOTextField)_registered(new com.webobjects.eointerface.swing.EOTextField(), "NSTextField2");
        _nsButton1 = (javax.swing.JButton)_registered(new javax.swing.JButton("Anuluj"), "NSButton");

        if ((delegate != null) && ((replacement = delegate.objectForOutletPath(this, "textFieldName")) != null)) {
            _nsTextField1 = (replacement == EOArchive._ObjectInstantiationDelegate.NullObject) ? null : (com.webobjects.eointerface.swing.EOTextField)replacement;
            _replacedObjects.setObjectForKey(replacement, "_nsTextField1");
        } else {
            _nsTextField1 = (com.webobjects.eointerface.swing.EOTextField)_registered(new com.webobjects.eointerface.swing.EOTextField(), "NSTextField");
        }

        if ((delegate != null) && ((replacement = delegate.objectForOutletPath(this, "popUpButtonOS")) != null)) {
            _popup0 = (replacement == EOArchive._ObjectInstantiationDelegate.NullObject) ? null : (javax.swing.JComboBox)replacement;
            _replacedObjects.setObjectForKey(replacement, "_popup0");
        } else {
            _popup0 = (javax.swing.JComboBox)_registered(new javax.swing.JComboBox(), "NSPopUpButton");
        }

        _nsButton0 = (javax.swing.JButton)_registered(new javax.swing.JButton("Utw\u00f3\u017c PC"), "NSButton1");
        _nsTextField0 = (com.webobjects.eointerface.swing.EOTextField)_registered(new com.webobjects.eointerface.swing.EOTextField(), "NSTextField11");
        _nsImageView0 = (com.webobjects.eointerface.swing.EOImageView)_registered(new com.webobjects.eointerface.swing.EOImageView(), "");

        if ((delegate != null) && ((replacement = delegate.objectForOutletPath(this, "npaPanel")) != null)) {
            _eoFrame0 = (replacement == EOArchive._ObjectInstantiationDelegate.NullObject) ? null : (com.webobjects.eointerface.swing.EOFrame)replacement;
            _replacedObjects.setObjectForKey(replacement, "_eoFrame0");
        } else {
            _eoFrame0 = (com.webobjects.eointerface.swing.EOFrame)_registered(new com.webobjects.eointerface.swing.EOFrame(), "newPCAssistenantPanel");
        }

        _nsView0 = (JPanel)_eoFrame0.getContentPane();
    }

    protected void _awaken() {
        super._awaken();
        _nsButton1.addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(_owner(), "closeNewPCAssistantPanel", _nsButton1), ""));

        if (_replacedObjects.objectForKey("_eoFrame0") == null) {
            _connect(_owner(), _eoFrame0, "npaPanel");
        }

        if (_replacedObjects.objectForKey("_nsTextField1") == null) {
            _connect(_owner(), _nsTextField1, "textFieldName");
        }

        if (_replacedObjects.objectForKey("_popup0") == null) {
            _popup0.setModel(new javax.swing.DefaultComboBoxModel());
            _popup0.addItem("DOS");
            _popup0.addItem("Windows 95/98/98SE/ME");
            _popup0.addItem("Windows 2000");
            _popup0.addItem("Windows XP");
            _popup0.addItem("Windows Vista");
            _popup0.addItem("Standardowy Go\u015b\u0107 Q");
        }

        if (_replacedObjects.objectForKey("_popup0") == null) {
            _connect(_owner(), _popup0, "popUpButtonOS");
        }

        _nsButton0.addActionListener((com.webobjects.eointerface.swing.EOControlActionAdapter)_registered(new com.webobjects.eointerface.swing.EOControlActionAdapter(_owner(), "preparePC", _nsButton0), ""));
    }

    protected void _init() {
        super._init();
        if (!(_nsBox0.getLayout() instanceof EOViewLayout)) { _nsBox0.setLayout(new EOViewLayout()); }
        _nsBox1.setSize(125, 1);
        _nsBox1.setLocation(2, 2);
        ((EOViewLayout)_nsBox0.getLayout()).setAutosizingMask(_nsBox1, EOViewLayout.MinYMargin);
        _nsBox0.add(_nsBox1);
        _nsBox0.setBorder(new com.webobjects.eointerface.swing._EODefaultBorder("", true, "Lucida Grande", 13, Font.PLAIN));
        _setFontForComponent(_nsTextField4, "Lucida Grande", 11, Font.PLAIN);
        _nsTextField4.setEditable(false);
        _nsTextField4.setOpaque(false);
        _nsTextField4.setText("System Operacyjny:");
        _nsTextField4.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        _nsTextField4.setSelectable(false);
        _nsTextField4.setEnabled(true);
        _nsTextField4.setBorder(null);
        _setFontForComponent(_nsTextField3, "Lucida Grande", 11, Font.PLAIN);
        _nsTextField3.setEditable(false);
        _nsTextField3.setOpaque(false);
        _nsTextField3.setText("Nazwa:");
        _nsTextField3.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        _nsTextField3.setSelectable(false);
        _nsTextField3.setEnabled(true);
        _nsTextField3.setBorder(null);
        _setFontForComponent(_nsTextField2, "Lucida Grande", 13, Font.PLAIN + Font.BOLD);
        _nsTextField2.setEditable(false);
        _nsTextField2.setOpaque(false);
        _nsTextField2.setText("Utw\u00f3rz nowego Go\u015bcia");
        _nsTextField2.setHorizontalAlignment(javax.swing.JTextField.LEFT);
        _nsTextField2.setSelectable(false);
        _nsTextField2.setEnabled(true);
        _nsTextField2.setBorder(null);
        _setFontForComponent(_nsButton1, "Lucida Grande", 13, Font.PLAIN);
        _nsButton1.setMargin(new Insets(0, 2, 0, 2));

        if (_replacedObjects.objectForKey("_nsTextField1") == null) {
            _setFontForComponent(_nsTextField1, "Lucida Grande", 13, Font.PLAIN);
            _nsTextField1.setEditable(true);
            _nsTextField1.setOpaque(true);
            _nsTextField1.setText("My New PC");
            _nsTextField1.setHorizontalAlignment(javax.swing.JTextField.LEFT);
            _nsTextField1.setSelectable(true);
            _nsTextField1.setEnabled(true);
        }

        if (_replacedObjects.objectForKey("_popup0") == null) {
            _setFontForComponent(_popup0, "Lucida Grande", 13, Font.PLAIN);
        }

        _setFontForComponent(_nsButton0, "Lucida Grande", 13, Font.PLAIN);
        _nsButton0.setMargin(new Insets(0, 2, 0, 2));
        _setFontForComponent(_nsTextField0, "Lucida Grande", 11, Font.PLAIN);
        _nsTextField0.setEditable(false);
        _nsTextField0.setOpaque(false);
        _nsTextField0.setText("Wprowad\u017a nazw\u0119 nowego go\u015bcia i wybierz system operacyjny jaki ma by\u0107 u\u017cywany.");
        _nsTextField0.setHorizontalAlignment(javax.swing.JTextField.LEFT);
        _nsTextField0.setSelectable(false);
        _nsTextField0.setEnabled(true);
        _nsTextField0.setBorder(null);
        if (!(_nsView0.getLayout() instanceof EOViewLayout)) { _nsView0.setLayout(new EOViewLayout()); }
        _nsImageView0.setSize(64, 64);
        _nsImageView0.setLocation(17, 14);
        ((EOViewLayout)_nsView0.getLayout()).setAutosizingMask(_nsImageView0, EOViewLayout.MinYMargin);
        _nsView0.add(_nsImageView0);
        _nsTextField0.setSize(279, 39);
        _nsTextField0.setLocation(98, 39);
        ((EOViewLayout)_nsView0.getLayout()).setAutosizingMask(_nsTextField0, EOViewLayout.MinYMargin);
        _nsView0.add(_nsTextField0);
        _nsButton0.setSize(95, 26);
        _nsButton0.setLocation(282, 184);
        ((EOViewLayout)_nsView0.getLayout()).setAutosizingMask(_nsButton0, EOViewLayout.MinYMargin);
        _nsView0.add(_nsButton0);
        _nsTextField2.setSize(179, 17);
        _nsTextField2.setLocation(98, 14);
        ((EOViewLayout)_nsView0.getLayout()).setAutosizingMask(_nsTextField2, EOViewLayout.MinYMargin);
        _nsView0.add(_nsTextField2);
        _nsButton1.setSize(75, 26);
        _nsButton1.setLocation(200, 184);
        ((EOViewLayout)_nsView0.getLayout()).setAutosizingMask(_nsButton1, EOViewLayout.MinYMargin);
        _nsView0.add(_nsButton1);
        _popup0.setSize(237, 26);
        _popup0.setLocation(137, 123);
        ((EOViewLayout)_nsView0.getLayout()).setAutosizingMask(_popup0, EOViewLayout.MinYMargin);
        _nsView0.add(_popup0);
        _nsTextField1.setSize(238, 22);
        _nsTextField1.setLocation(136, 95);
        ((EOViewLayout)_nsView0.getLayout()).setAutosizingMask(_nsTextField1, EOViewLayout.MinYMargin);
        _nsView0.add(_nsTextField1);
        _nsTextField3.setSize(120, 14);
        _nsTextField3.setLocation(11, 101);
        ((EOViewLayout)_nsView0.getLayout()).setAutosizingMask(_nsTextField3, EOViewLayout.MinYMargin);
        _nsView0.add(_nsTextField3);
        _nsTextField4.setSize(120, 14);
        _nsTextField4.setLocation(11, 129);
        ((EOViewLayout)_nsView0.getLayout()).setAutosizingMask(_nsTextField4, EOViewLayout.MinYMargin);
        _nsView0.add(_nsTextField4);
        _nsBox0.setSize(400, 5);
        _nsBox0.setLocation(-7, 163);
        ((EOViewLayout)_nsView0.getLayout()).setAutosizingMask(_nsBox0, EOViewLayout.MinYMargin);
        _nsView0.add(_nsBox0);

        if (_replacedObjects.objectForKey("_eoFrame0") == null) {
            _nsView0.setSize(386, 220);
            _eoFrame0.setTitle("New Guest PC");
            _eoFrame0.setLocation(211, 324);
            _eoFrame0.setSize(386, 220);
        }
    }
}