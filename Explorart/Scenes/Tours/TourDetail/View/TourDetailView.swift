//
//  TourDetailView.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 30/07/24.
//

import SwiftUI

struct TourDetailView: View {
    @StateObject var viewModel: TourDetailViewModel

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https" + viewModel.tour.image.dropFirst(4))) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 300)
                VStack(alignment: .leading) {
                    Text(viewModel.tour.title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.highlight)
                        .padding(.bottom)
                    
                    Text(
                        viewModel.tour.description.replacingOccurrences(
                            of: "<[^>]+>",
                            with: "",
                            options: .regularExpression,
                            range: nil
                        )
                    )
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.accent)
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
        }

        EPXSUIButton(action: {
            viewModel.goToTourBooking()
        }, title: "Book Tour")
        .padding()
    }
}

#Preview {
    TourDetailView(viewModel: TourDetailViewModel(
        tour: ToursModel.Tour(id: 1, 
                              apiModel: "",
                              apiLink: "",
                              title: "Multisensory Tour",
                              image: "",
                              description: "Travel back in time through the magic of the Thorne Rooms."))
    )
}
