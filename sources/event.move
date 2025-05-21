module liquidlink_protocol::event {
    use iota::event;

    public struct ProfileCreated has copy, drop {
        owner: address,
        profile: ID
    }
    
    public fun profile_created(
        owner: address,
        profile: ID
    ) {
        abort 0
    }

    public struct ProfileDestroyed has copy, drop {
        owner: address,
        profile: ID
    }
    
    public fun profile_destroyed(
        owner: address,
        profile: ID
    ) {
        abort 0
    }
} 