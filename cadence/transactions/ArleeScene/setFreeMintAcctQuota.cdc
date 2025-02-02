import Arlequin from "../../contracts/Arlequin.cdc"

transaction(addr: Address, mint: UInt64) {

    let arleeSceneAdmin : &Arlequin.ArleeSceneAdmin

    prepare(acct: AuthAccount) {
        self.arleeSceneAdmin = acct.borrow<&Arlequin.ArleeSceneAdmin>(from: Arlequin.ArleeSceneAdminStoragePath) 
            ?? panic (" Cannot borrow reference to ArleeScene Admin")
    }

    execute {
        self.arleeSceneAdmin.setFreeMintAcctQuota(addr: addr, mint: mint)
    }

}