module liquidlink_protocol::event {
    use iota::event;
    use iota::object::ID;
    use std::ascii::String;

    public struct ProfileCreated has copy, drop {
        owner: address,
        profile: ID
    }
    
    public fun profile_created(
        owner: address,
        profile: ID
    ){
        abort 0
    }

    public struct ProfileDestroyed has copy, drop {
        owner: address,
        profile: ID
    }
    
    public fun profile_destroyed(
        owner: address,
        profile: ID
    ){
        abort 0
    }

    public struct ShareInvitation has copy, drop {
        invitee: address,
        inviter: address,
        amount: u256,
        action: String
    }
    
    public fun share_invitation(
        invitee: address,
        inviter: address,
        amount: u256, 
        action: String
    ){
        abort 0
    }
}