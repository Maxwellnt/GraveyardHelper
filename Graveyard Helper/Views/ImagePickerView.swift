//
//  ImagePickerView.swift
//  Graveyard Helper
//
//  Created by alumne on 13/12/2023.
//

import SwiftUI

struct ImagePickerView: View {
  @Binding var entry: Entry

  var body: some View {
    Picker(selection: $entry, label: Text("")) {
      ForEach(Entry.allCases, id: \.self) {
        Text($0.rawValue).font(.largeTitle)
      }
    }
    .pickerStyle(WheelPickerStyle())
  }
}

struct EntryPicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(entry: .constant(Entry.apple))
    }
}
