module liquidlink_protocol::point {
    use std::ascii::String;
    use std::option::{Self, Option};
    use iota::event;
    use iota::clock::Clock;
    use iota::table::{Self, Table};
    use iota::vec_map::{Self, VecMap};
    use iota::object::{Self, UID};
    use iota::tx_context::TxContext;
    
    // Public structs
    public struct PointKey<phantom T> has store {}
    
    public struct AddPointRequest<phantom T> has key {
        id: UID,
        action: String,
        owner: address,
        points: u256,
        updater: address
    }
    
    public struct SubPointRequest<phantom T> has key {
        id: UID,
        action: String,
        owner: address,
        points: u256,
        updater: address
    }
    
    public struct StakePointRequest<phantom T> has key {
        id: UID,
        action: String,
        owner: address,
        weight: u256,
        duration: u64,
        updater: address
    }
    
    public struct UnstakePointRequest<phantom T> has key {
        id: UID,
        action: String,
        owner: address,
        weight: u256,
        duration: u64,
        updater: address
    }
    
    public struct UserInfo has store, copy, drop {
        points: VecMap<String, u256>,
        configs: VecMap<String, Config>
    }
    
    public struct Config has store, copy, drop {
        timestamp: u64,
        weight: u256,
        duration: u64
    }
    
    public struct PointDashBoard<phantom T> has key, store {
        id: UID,
        user_infos: Table<address, UserInfo>
    }
    
    public struct LiquidlinkAddPointEvent<phantom T> has copy, drop {
        action: String,
        owner: address,
        points: u256
    }
    
    public struct LiquidlinkSubPointEvent<phantom T> has copy, drop {
        action: String,
        owner: address,
        points: u256
    }
    
    public struct LiquidlinkStakePointEvent<phantom T> has copy, drop {
        action: String,
        owner: address,
        weight: u256,
        duration: u64
    }
    
    public struct LiquidlinkUnstakePointEvent<phantom T> has copy, drop {
        action: String,
        owner: address,
        weight: u256,
        duration: u64
    }
    
    // Public functions
    public fun total_points<T>(dashboard: &PointDashBoard<T>): u256 {
        abort 0
    }
    
    public fun get_user_info<T>(dashboard: &PointDashBoard<T>, user: address): Option<UserInfo> {
        abort 0
    }
    
    public fun get_user_info_points<T>(
        dashboard: &PointDashBoard<T>,
        user: address,
        clock: &Clock
    ): u256 {
        abort 0
    }
    
    public fun get_user_info_point_by_action<T>(
        dashboard: &PointDashBoard<T>,
        action: String,
        user: address,
        clock: &Clock
    ): u256 {
        abort 0
    }
    
    public fun send_add_point_req<T: drop>(
        witness: &T,
        action: String,
        points: u256,
        ctx: &mut TxContext
    ) {
        abort 0
    }
    
    public fun send_add_point_req_with_assigned_updater<T: drop>(
        witness: &T,
        action: String,
        points: u256,
        updater: address,
        ctx: &mut TxContext
    ) {
        abort 0
    }
    
    public fun send_add_point_req_with_owner<T: drop>(
        witness: &T,
        action: String,
        points: u256,
        owner: address,
        ctx: &mut TxContext
    ) {
        abort 0
    }
    
    public fun send_sub_point_req<T: drop>(
        witness: &T,
        action: String,
        points: u256,
        ctx: &mut TxContext
    ) {
        abort 0
    }
    
    public fun send_sub_point_req_with_assigned_updater<T: drop>(
        witness: &T,
        action: String,
        points: u256,
        updater: address,
        ctx: &mut TxContext
    ) {
        abort 0
    }
    
    public fun send_sub_point_req_with_owner<T: drop>(
        witness: &T,
        action: String,
        points: u256,
        owner: address,
        ctx: &mut TxContext
    ) {
        abort 0
    }
    
    public fun send_stake_point_req<T: drop>(
        witness: &T,
        action: String,
        weight: u256,
        duration: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        abort 0
    }
    
    public fun send_stake_point_req_with_assigned_updater<T: drop>(
        witness: &T,
        action: String,
        weight: u256,
        duration: u64,
        clock: &Clock,
        updater: address,
        ctx: &mut TxContext
    ) {
        abort 0
    }
    
    public fun send_stake_point_req_with_owner<T: drop>(
        witness: &T,
        action: String,
        weight: u256,
        duration: u64,
        clock: &Clock,
        owner: address,
        ctx: &mut TxContext
    ) {
        abort 0
    }
    
    public fun send_unstake_point_req<T: drop>(
        witness: &T,
        action: String,
        weight: u256,
        duration: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        abort 0
    }
    
    public fun send_unstake_point_req_with_assigned_updater<T: drop>(
        witness: &T,
        action: String,
        weight: u256,
        duration: u64,
        clock: &Clock,
        updater: address,
        ctx: &mut TxContext
    ) {
        abort 0
    }
    
    public fun send_unstake_point_req_with_owner<T: drop>(
        witness: &T,
        action: String,
        weight: u256,
        duration: u64,
        clock: &Clock,
        owner: address,
        ctx: &mut TxContext
    ) {
        abort 0
    }
} 