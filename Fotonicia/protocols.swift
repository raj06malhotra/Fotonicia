//
//  protocols.swift
//  Fotonicia
//
//  Created by sawan on 13/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit


protocol featuredCategoryDelegate {
    func viewallBtnDidTap(cell: featuredCell)
}




protocol homeMadeArtDelegate {
    func viewall_hma_BtnDidTap(cell: homemadeArtCell)
}




protocol topCategoryCell2Delegate {
    func BtnDidTap(cell: topCategoryCell, titletxt:String)
}



protocol formCellDelegate {
    func BtnDidTap(cell: formCell, indexpath:Int)
}




protocol signoutDelegate {
    func callSignout(cell:myaccountfooterCell)
}


protocol layoutSelectDelegate {
    func sendlayout(cell:childunderchildcell)
}


protocol layoutSelectDelegate2 {
    func sendlayout(cell:ChildCollectionViewCell, img: String, layout_id:String)
}


protocol removewishlishtdelegate {
    func removewish(cell: wishlistCell)
}


protocol ImageZoomInDelegate {
    func popUpImage(image:UIImageView)
}

protocol ImageZoomInDelegate2 {
    func popUpImage(image:UIImageView)
}

protocol customalertdelegate  {
    func customaalertv(cell: cartCell1)
    func customalertview(cell: cartCell1)
    func donatepr(cell: cartCell1)
}
