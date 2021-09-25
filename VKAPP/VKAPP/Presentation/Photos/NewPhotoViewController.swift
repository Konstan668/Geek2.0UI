
import UIKit

class NewPhotoViewController: UIViewController {
    
    var myCollectionView: UICollectionView?
    var users = User(userName: "", userImageName: "", userPhotossName: [""])
    var one = ""
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        let view = UIView()
        view.backgroundColor = .black
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        let collectionViewFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        myCollectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        myCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView?.backgroundColor = .red
        
        myCollectionView?.translatesAutoresizingMaskIntoConstraints = false

        
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        
        view.addSubview(myCollectionView ?? UICollectionView())
        
        self.view = view
        addCinstraints()
    print("one = ", one)
    }
    
    func addCinstraints(){
        view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        myCollectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        myCollectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        myCollectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        myCollectionView?.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    }
    
    
    
    
}


extension NewPhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.userPhothosName.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.backgroundColor = .brown
//        cell.photoImage.image = UIImage(named: users.userPhothosName[indexPath.row])
//        cell.photoImage.contentMode = .scaleAspectFit
        return myCell
    }
    
    
}
